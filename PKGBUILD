# Maintainer: Xuanwo <xuanwo@archlinuxcn.org>
pkgname=openai-translator-bin
_pkgname=openai-translator
pkgver=0.0.32
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
sha256sums=('558cb91ecaf6b4b287c592398d7bf30a18761e97576a48cb664fbcbcb88d30d9')

package() {
    cd "$srcdir/"
    tar -xvf data.tar.gz
    install -d ${pkgdir}/usr/
    cp -r $srcdir/usr/* ${pkgdir}/usr/
}
