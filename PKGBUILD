# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase=scrape-git
pkgname='scrape-git'
pkgver=2.e7badce
pkgrel=1
pkgdesc="Snake like game written in python3"
arch=(any)
url="https://github.com/lxgr-linux/scrape"
license=('GPL3')
depends=('python')
provides=('scrape')
depends=('python' 'python-scrap_engine-git')
makedepends=('git')
source=("$pkgbase"::'git+https://github.com/lxgr-linux/scrape')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "${srcdir}/$pkgbase"
  install -Dm0755 -t "$pkgdir/usr/bin" "scrape.py"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/scrape/LICENSE"
}
