# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.19.9
pkgrel=1
pkgdesc="Samsung Firmware Downloader"
url='https://github.com/zacharee/SamloaderKotlin'
arch=('x86_64' 'aarch64')
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'zlib' 'libglvnd' 'libxi' 'hicolor-icon-theme' 'libxtst' 'libx11' 'libxrender' 'libxext' 'alsa-lib' 'fontconfig' 'freetype2')
source=("https://raw.githubusercontent.com/zacharee/SamloaderKotlin/refs/tags/${pkgver}/LICENSE.txt")
source_x86_64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('778075b8a5fb9c5bc6ea65da17ad6adb0b5c69bbebf52a965d285487dafcd316')
sha256sums_x86_64=('755c91704de002de677fc0d7dca3419aa5c8c3dafd0382dba499ebfba0d20bfc')
sha256sums_aarch64=('dffecf56e1e9f43cb110406cc16dc812f5cb11d5071daacaa2bd51e386748432')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
