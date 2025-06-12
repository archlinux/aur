# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.20.2
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
b2sums=('693b28ed14fb782eab4399104bb968fe613447c1f005495a5cd3791f3032e71dbb6b418cfa4b874562891deb60d4fb53ca1e7f965b571c35f6bdba0eb5d624d4')
b2sums_x86_64=('d694ef652ebdc28e3db999cd45dbd19c823f89d0c904654c87d028e3ad6b32f44a73e4eb03a95e976a6e47e1b540aceb7e857eb1caaa8189f50dfd5bcc828a43')
b2sums_aarch64=('1c029a2ba64c813592d922760cd185b2c64fea9b04424efd7872e5e719d752df9b25ff6e36c6ae86a776ef84e55992a5f9bba42923aec110201a9d4d16868274')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
