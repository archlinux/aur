# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase=scrape-git
pkgname='scrape-git'
pkgver=0.1.0
pkgrel=1
pkgdesc="Snake like game written in python3"
arch=(any)
url="https://github.com/lxgr-linux/scrape"
license=('GPL3')
provides=('scrape')
depends=('python' 'python-scrap_engine-git')
makedepends=('git')
source=("$pkgbase"::'git+https://github.com/lxgr-linux/scrape')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/$pkgbase"
  install -Dm0755 -t "$pkgdir/usr/bin" "scrape.py"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/scrape/LICENSE"
}
