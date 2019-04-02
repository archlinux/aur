# Maintainer: Ron Asimi <ron dot asimi at gmail dot com>
_pkgname=termsyn-powerline
pkgname=${_pkgname}-font-git
pkgver="r2.2415446"
pkgrel=1
pkgdesc='Termsyn-Powerline is a clean monospaced bitmap font based on Termsyn, with added characters for powerline-shell.'
arch=('any')
url='https://github.com/Anarky/Termsyn-Powerline'
license=('GPLv2')
depends=('fontconfig' 'xorg-font-utils')
source=("${_pkgname}::git+https://github.com/Anarky/${_pkgname}.git")
sha256sums=('SKIP')
makedepends=('git')
install=termsyn-powerline-font.install
pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d ${pkgdir}/usr/share/fonts/$_pkgname/
    install -m644 "${_pkgname}/"*.pcf ${pkgdir}/usr/share/fonts/$_pkgname/
}
