# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='ucollage'
pkgname="${_pkgname}-git"
pkgver=0.1.0.r1.g684c52d
pkgrel=1
pkgdesc='Terminal image viewer based on Überzug'
arch=('any')
url='https://github.com/ckardaris/ucollage'
license=('GPL3')
depends=('ueberzug')
makedepends=('git')
optdepends=('ffmpeg: display video thumbnails'
            'imagemagick: image rotation'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  install -Dm755 "${_pkgname}/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
