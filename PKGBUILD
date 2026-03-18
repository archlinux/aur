# Maintainer: Relish0171 <aur.such581@aleeas.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Eri the Switch <e2024@opayq.com>
_basename=bifrost
pkgname=${_basename}-bin
pkgver=1.20.5
pkgrel=2
pkgdesc="Samsung Firmware Downloader"
arch=('x86_64' 'aarch64')
url="https://github.com/zacharee/SamloaderKotlin"
license=('MIT')
provides=("${_basename}")
conflicts=("${_basename}")
depends=('glibc' 'gcc-libs' 'zlib' 'libglvnd' 'libxi' 'hicolor-icon-theme' 'libxtst' 'libx11' 'libxrender' 'libxext' 'alsa-lib' 'fontconfig' 'freetype2')
source=("https://raw.githubusercontent.com/zacharee/SamloaderKotlin/refs/tags/${pkgver}/LICENSE.txt")
source_x86_64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_basename}-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/zacharee/SamloaderKotlin/releases/download/${pkgver}/${_basename}-${pkgver}-linux-aarch64.tar.gz")
sha256sums=('778075b8a5fb9c5bc6ea65da17ad6adb0b5c69bbebf52a965d285487dafcd316')
sha256sums_x86_64=('fccf689f553d8a521d7412730956a26a52281a5f360edbec5618b6b9f90fbb05')
sha256sums_aarch64=('e1b24fe5e581bb3dc2112a1ded1ad8ed006aa1c8e56668550e6ddab68c60c704')

package() {
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "${srcdir}/${_basename}-${pkgver}"

    install -Dm755 "bin/${_basename}" "${pkgdir}/usr/lib/${_basename}/bin/${_basename}"

    cp -r "lib" "${pkgdir}/usr/lib/${_basename}/"
    cp -r "share" "${pkgdir}/usr/lib/${_basename}/"

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s "/usr/lib/${_basename}/bin/${_basename}" "${pkgdir}/usr/bin/${_basename}"
}
