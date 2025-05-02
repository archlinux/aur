# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>

_pkgname="bifrost"
pkgname="${_pkgname}-bin"
pkgver=1.20.1
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
b2sums_x86_64=('cf7d597f1d939e1fcf3046fc4693afba6c097da7833aadf4cefde6c2bd2c8095f37a4b651f6ae0e407f53f48adf304d57d0f848c65a1b5154e8b1e315bd8141c')
b2sums_aarch64=('3f6f2d370f6dabe4240c56ca5d06cecd06cb834e316fccfebd6faf381e27fd3c1bbc5e4908813048ea71ad9b8ac61f3deddf07f74d630ffd09e5824418e80669')

package() {
    bsdtar -xf data.tar.xz -C "$pkgdir/"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
