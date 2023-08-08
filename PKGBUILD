# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=shutter-encoder-bin
pkgver=17.3
pkgrel=2
pkgdesc="Converter for all formats video|audio|image professionnals codecs and standards - swiss knife tool for Linux"
arch=("x86_64")
url="https://www.shutterencoder.com"
_githuburl="https://github.com/paulpacifico/shutter-encoder"
license=("GPL3")
depends=('zlib' 'glibc' 'bash' 'gcc-libs' 'libxml2' 'libxtst' 'freetype2' 'libjpeg-turbo' 'libxi' 'libxrender' 'libx11' \
    'libxext' 'perl' 'util-linux-libs' 'lcms2' 'libbsd' 'alsa-lib' 'java-runtime' 'ffmpeg')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/Shutter%20Encoder%20${pkgver}%20Linux%2064bits.deb")
sha256sums=('5a56f118ccbdb46249938184fa705bcd1ed8b543505d672e732aa3d462c1d4bf')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    find "${pkgdir}" -type f -name "*.*" -perm 777 -exec chmod 644 {} \;
    find "${pkgdir}" -type f -perm 777 -exec chmod 755 {} \;
}