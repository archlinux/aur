# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-git
pkgver=0.43.r17.g1f75f01
pkgrel=2
pkgdesc='Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad vulnerability/mitigation checker'
arch=('any')
url='https://github.com/speed47/spectre-meltdown-checker'
license=('GPL3')
makedepends=('git')
provides=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
