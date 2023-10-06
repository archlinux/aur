# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.0.88
pkgrel=1
pkgdesc="Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=("x86_64")
url="https://github.com/yetone/openai-translator"
license=('MIT')
provides=("openai-translator")
conflicts=("openai-translator-git" "openai-translator")
depends=('webkit2gtk' 'xdotool' 'libayatana-appindicator')
source=(
    "https://github.com/yetone/openai-translator/releases/download/v${pkgver}/open-ai-translator_${pkgver}_amd64.deb"
)
sha256sums=('92d527a9f84f0ca25e68a42a8f3099539e52abaf9e67d042315a7cb5de6c03c7')

package() {
    cd "$srcdir/"
    tar -xvf data.tar.gz
    install -d ${pkgdir}/usr/
    cp -r $srcdir/usr/* ${pkgdir}/usr/
}
