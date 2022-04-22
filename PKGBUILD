# Maintainer: Stefan Auditor <stefan@auditor.email>
# Please report issues at https://github.com/sanduhrs/arch-aur-phpstorm-url-handler

_pkgname=phpstorm-url-handler
pkgname=${_pkgname}
pkgver=1.5.0
pkgrel=1
pkgdesc="Open phpstorm:// URLs in PHPStorm."
arch=('any')
url='https://github.com/sanduhrs/phpstorm-url-handler'
license=('GPL')
depends=('desktop-file-utils')
makedepends=("git")
optdepends=('wmctrl: window focus and forground handler')
install=${_pkgname}.install
source=("${_pkgname}"::"git+https://github.com/sanduhrs/phpstorm-url-handler.git")
sha512sums=('SKIP')

package() {
  cd "${srcdir}"
  install -Dm755 ${_pkgname}/${_pkgname} "$pkgdir/usr/bin/${_pkgname}"
  RPM_BUILD_ROOT=$pkgdir desktop-file-install ${_pkgname}/${_pkgname}.desktop
}
