# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=nile-git
pkgver=r38.7b825bd
pkgrel=1
pkgdesc="Unofficial Amazon Games client"
arch=('any')
url="https://github.com/imLinguin/nile"
license=('GPL3')
depends=('bash' 'python-protobuf' 'python-pycryptodome' 'python-pyqt5-webengine'
         'python-requests' 'python-zstandard')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/imLinguin/nile.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/opt/${pkgname%-git}"
  cp -r assets bin "${pkgname%-git}" "$pkgdir/opt/${pkgname%-git}/"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/${pkgname%-git}/bin/${pkgname%-git}" "$pkgdir/usr/bin/"
}
