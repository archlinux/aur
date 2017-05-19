# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=anarki
pkgname=${_pkgname}-git
pkgver=r878.cfdb0a1
pkgrel=1
pkgdesc="Community-managed fork of the Arc dialect of Lisp. (GIT version)"
arch=('x86_64' 'i686')
url="https://github.com/arclanguage/anarki"
license=('MIT' 'PerlArtistic')
depends=('racket')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/arclanguage/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "${pkgdir}/usr/share" "${pkgdir}/usr/bin"
  cp -R "${_pkgname}" "${pkgdir}/usr/share/${_pkgname}"
  chmod 755 -R "${pkgdir}/usr/share/${_pkgname}"
  ln -s "/usr/share/${_pkgname}/arc.sh" "${pkgdir}/usr/bin/arc"
}

# vim:set ts=2 sw=2 et:
