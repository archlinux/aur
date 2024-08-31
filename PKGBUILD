# Maintainer: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.19.3
pkgrel=1
pkgdesc="Samsung Firmware Downloader"
url='https://github.com/zacharee/SamloaderKotlin'
arch=('x86_64' 'aarch64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'zlib' 'libglvnd' 'libxi' 'hicolor-icon-theme' 'libxtst' 'libx11' 'libxrender' 'libxext' 'alsa-lib' 'fontconfig' 'freetype2')
source=("LICENSE.txt")
source_x86_64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('778075b8a5fb9c5bc6ea65da17ad6adb0b5c69bbebf52a965d285487dafcd316')
sha256sums_x86_64=('d45b75b07f162aa29929a0e9893655a84e3c4d0c85675c221fb79e67b057a703')
sha256sums_aarch64=('1a7ae68140148ef92c1a1c98e2562c068912334a8d6bcc6f4a1d39d0e504d5e7')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
