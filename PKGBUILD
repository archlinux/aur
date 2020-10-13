# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='ucollage'
pkgname="${_pkgname}-git"
pkgver=r82.4a7e9a9
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
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${_pkgname}"
  install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${_pkgname}.1" -t "${pkgdir}/usr/share/man/man1"
  install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

# vim: ts=2 sw=2 et:
