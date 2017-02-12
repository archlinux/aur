# Maintainer: Sander Verkuil <saverkuil@gmail.com>
# Please report issues at https://github.com/SanderVerkuil/arch-aur-rubymine-url-handler

_pkgname=rubymine-url-handler
pkgname=("${_pkgname}-git")
pkgver=1.0.0
pkgrel=1
pkgdesc="Open x-mine:// URLs in RubyMine."
arch=("any")
url="https://github.com/SanderVerkuil/${_pkgname}"
license=("GPL")
depends=("desktop-file-utils" "rubymine")
makedepends=("git")
install=${_pkgname}.install
source=("${_pkgname}"::"git+${url}")
sha512sums=("SKIP")
provides=(${_pkgname})
conflicts=(${_pkgname})

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  RPM_BUILD_ROOT="${pkgdir}" desktop-file-install "${_pkgname}/${_pkgname}.desktop"
}
