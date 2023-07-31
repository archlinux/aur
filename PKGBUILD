# Maintainer: corbin.zip (me at corbin dot zip)

pkgname=bcdl-git
pkgver=20230726
pkgrel=1
epoch=
pkgdesc="Automated Bandcamp album downloader"
arch=('any')
url="https://github.com/corbin-ch/bcdl.git"
license=('GPL3')
depends=('python' 'python-requests' 'python-selenium')
makedepends=('git')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  echo $(git show -s --format="%ci" HEAD | sed 's/-//g' | cut -d ' ' -f 1)
}

package() {
  cd "$pkgname"
  install -Dm755 bcdl.py "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
