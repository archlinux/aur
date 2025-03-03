# Maintainer: Emily Ehlert <arch@amalthea.anonaddy.com>
# Contributor: Hayate Nakamura <is01.njb at gmail dot com>
_pkgname="pacup-arch"
pkgname="${_pkgname}-git"
pkgver=r78.aacece1
pkgrel=1
pkgdesc="Simplify Pacman, Flatpak Snap, and AUR package updating."
arch=('any')
url="https://github.com/7ritn/pacup-arch"
license=('GPL-3.0-only')
depends=('pacman' 'bash')
makedepends=('git')
optdepends=('flatpak: For updating flatpak packages'
            'snapd: For updating snap packages'
            'yay: For updating AUR packages'
            'pacaur: For updating AUR packages'
            'pikaur: For updating AUR packages'
            'aura: For updating AUR packages'
            'paru: For updating AUR packages')
source=("${_pkgname}::git+https://github.com/7ritn/pacup-arch.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m644 "pacup_Manual.txt" "${pkgdir}/usr/share/doc/${_pkgname}/pacup_manual.txt"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -D -m755 "pacup" "${pkgdir}/usr/bin/pacup"
}
