# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

_pkgname=spectre-meltdown-checker
pkgname=${_pkgname}-git
pkgver=v0.43.r16.g14a53b1
pkgrel=1
pkgdesc="Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad vulnerability/mitigation checker"
arch=('any')
url="https://github.com/speed47/${_pkgname}"
license=('GPL3')
source=("git+${url}.git"
        'LICENSE'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
