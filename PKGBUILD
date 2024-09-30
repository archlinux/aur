# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: lmartinez-mirror
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=spectre-meltdown-checker-git
_pkgname=${pkgname%-git}
pkgver=0.46.r29.g34c6095
pkgrel=1
pkgdesc='Spectre, Meltdown, Foreshadow, Fallout, RIDL, ZombieLoad vulnerability/mitigation checker'
arch=('any')
url='https://github.com/speed47/spectre-meltdown-checker'
license=('GPL-3.0-only')
depends=('sh')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
}
