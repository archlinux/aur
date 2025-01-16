# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=dano
pkgname=${_basename}-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A hashdeep/md5tree (but much more) for media files"
arch=('x86_64')
url="https://github.com/kimono-koans/dano"
license=('MPL-2.0 ')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('ffmpeg' 'gcc-libs' 'glibc')
optdepends=("flac: to import FLAC file's checksums")
source_x86_64=("${url}/releases/download/${pkgver}/${_basename}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums_x86_64=('cfd777fca6e116aa2d0b81386c49caa8f890a51f9324fe8c1057d2974130b5cc')

package() {
  cd "${pkgdir}"

  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.xz"

  mv "${pkgdir}/usr/share/doc/${_basename}" "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
  mv "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"* "${pkgdir}/usr/share/licenses/${pkgname}/"
}
