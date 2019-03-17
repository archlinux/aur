# Maintainer: Patrick Schratz <patrick.schratz@gmail.com>
# Adapted from nodejs-mkdirp

pkgname=nodejs-decktape
_npmname=decktape
pkgver=2.9.2
pkgrel=1
pkgdesc='PDF exporter for HTML presentation frameworks'
arch=('any')
url='https://github.com/astefanutti/decktape'
license=('MIT')
depends=('npm' 'nodejs')
source=("${_npmname}-${pkgver}.tar.gz::https://github.com/astefanutti/"${_npmname}"/archive/v"${pkgver}".tar.gz")

package() {
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install --user root -g --prefix "$pkgdir/usr" $_npmname@$pkgver
  # rmdir "${pkgdir}/usr/etc"
}
md5sums=('4220719ec9e8e998072a7f3a78ce024e')
