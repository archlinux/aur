# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.0.15
pkgrel=2
pkgdesc="Browser extension and cross-platform desktop application for translation based on ChatGPT API."
arch=("x86_64")
url="https://github.com/yetone/openai-translator"
license=('MIT')
provides=("openai-translator")
conflicts=("openai-translator-git" "openai-translator")
depends=('webkit2gtk')
source=(
    "https://github.com/yetone/openai-translator/releases/download/v${pkgver}/open-ai-translator_${pkgver}_amd64.deb"
)
sha256sums=('e00e1382684f1b742e72abcfbc2c6af5f9fd75169cd147a585d1a4afac92e84d')

package() {
    cd "$srcdir/"
    tar -xvf data.tar.gz
    install -d ${pkgdir}/usr/
    cp -r $srcdir/usr/* ${pkgdir}/usr/
}
