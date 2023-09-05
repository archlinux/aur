# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dgdecodenv
pkgbase=dgnvindex-bin
pkgname=(
  'dgindexnv-bin'
  "vapoursynth-plugin-${_plug}-bin"
#  "avisynth-plugin-${_plug}-bin"
)
pkgver=2.31
pkgrel=3
pkgdesc="AVC/HEVC/MPG/VC1 Decoder and Frame Server"
arch=('x86_64')
url='https://www.rationalqm.us/dgdecnv/dgdecnv.html'
license=('custom:Donald A. Graft')
source=("https://www.rationalqm.us/dgdecnv/binaries/dgdecnv_linux_${pkgver/./}.zip")
#        https://www.rationalqm.us/dgdecnv/binaries/dgdecnv_linux_231.zip
sha256sums=('5dce497d6bd3f3f24cc4a44dffb62508dd419a21269a3e77dad86505de0ef380')
DLAGENTS=('https::/usr/bin/curl -A "Chrome/88.0.4324.182" -o %o %u')

package_dgindexnv-bin() {
  pkgdesc="AVC/HEVC/MPG/VC1 Decoder and Frame Server"
  depends=(
    'glibc'
    'zlib' 'libz.so'
  )
  conflicts=(
    'dgindexnv'
    'dgnvindex-bin'
     )
  provides=('dgindexnv')
  replaces=('dgnvindex-bin')

  install -Dm755 dgindexnv "${pkgdir}/usr/bin/dgindexnv"

  install -Dm644 LinuxUserManual.txt "${pkgdir}/usr/share/doc/${pkgname}/LinuxUserManual.txt"
  install -Dm644 LinuxLimitations.txt "${pkgdir}/usr/share/doc/${pkgname}/LinuxLimitations.txt"
}

package_vapoursynth-plugin-dgdecodenv-bin() {
  pkgdesc="Plugin for Vapoursynth: ${_plug}"
  depends=(
    'vapoursynth'
    'gcc-libs'
    'glibc'
    'zlib' 'libz.so'
    'nvidia-utils'
  )
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm755 libdgdecodenv.so "${pkgdir}/usr/lib/vapoursynth/libdgdecodenv.so"
  install -Dm644 LinuxUserManual.txt "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/LinuxUserManual.txt"
}

package_avisynth-plugin-dgdecodenv-bin() {
  pkgdesc="Plugin for Avisynth: ${_plug}"
  depends=(
    'avisynthplus'
    'gcc-libs'
    'glibc'
    'zlib' 'libz.so'
    'nvidia-utils'
  )
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm755 libdgdecodenv.so "${pkgdir}/usr/lib/avisynth/libdgdecodenv.so"
  install -Dm644 LinuxUserManual.txt "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/LinuxUserManual.txt"
}