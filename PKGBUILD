# Maintainer: Kirill I <elephanttalk+aur@protonmail.com>

pkgname=rearchiver-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Prepare Reaper projects for archiving by converting WAV to FLAC/WavPack'
arch=('x86_64')
url='https://github.com/indiscipline/rearchiver'
license=('GPL-3.0-or-later')
depends=('glibc' 'flac')
optdepends=('wavpack: 32/64-bit floating point support')
provides=('rearchiver')
conflicts=('rearchiver')
options=('!strip')
source=(
  "rearchiver-${pkgver}::https://github.com/indiscipline/rearchiver/releases/download/v0.3.0/rearchiver_linux"
  "LICENSE-${pkgver}::https://github.com/indiscipline/rearchiver/raw/v0.3.0/LICENSE.md"
)
sha256sums=('f15583a04ae533d917ba3498cfcd8299159e0fe32e57b9c37bfc19f7b473fcbe' '72d6e1a0ffb74e5e95841061200da2f5e14b66bbe043f41e634ef9bc6070132a')

package() {
  install -Dm755 "${srcdir}/rearchiver-${pkgver}"     "${pkgdir}/usr/bin/rearchiver"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}"     "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
