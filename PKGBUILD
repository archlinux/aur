# Maintainer: Nanami <Yejia995@gmail.com>
# Contributor: bilibili_xiaok <the_xiaok@qq.com>
# Contributor: little_sheepycn <little_sheepycn@redstonebuild.onmicrosoft.com>
# Icon based on https://github.com/Peternal
pkgname=bilibili-electron
_pkgname=${pkgname%-bin}
pkgver=1.9.1
pkgrel=3
pkgdesc='A Linux bilibili GUI. Use installed electron.'
arch=('any')
license=('MIT')
url='https://github.com/msojocs/bilibili-linux'
install=${pkgname}.install
provides=(${_pkgname})
conflicts=('bilibili-bin')
depends=('electron' 'ffmpeg')
optdepends=('')
makedepends=('asar')
source_x86_64=('${pkgname}-${pkgver}-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}-${pkgrel}/bilibili-v${pkgver}-${pkgrel}-x86_64.tar.gz')
# source_aarch64=('${pkgname}-${pkgver}-aarch64-linux.tar.gz::${url}/releases/download/${pkgver}/bilibili-v${pkgver}-arm64.tar.gz')
source=(
    '${pkgname}.desktop'
    '${pkgname}.svg'
    '${pkgname}')
sha256sums=('772934b365c0dffa836d463fa8600fceb2a2b789cb8eb9d3d51ee6fddad1d21c'
            '256fb103121107cf757ecd89caecffb792fd448ae139a1f18d017171ac8a3a06'
            '5bd642f412a7b182fe5c371a0382f5e232df30048735a60fec935df159ff8933')
sha256sums_x86_64=('280bb435d379185e298eef9becfce2abcc8efdeb03fb4368b3dd822279abc7d6')
# sha256sums_aarch64=('e137673bbdf9b2e44fadd961547ed1016d0ad50f4d4f03b56ae8211262f72887')

build() {
    cd $srcdir
}

package() {
    rm -rf bin
    rm -rf electron
    install -Dm644 '${pkgname}.svg' '$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg'
    install -Dm644 '${srcdir}/app/app-update.yml' '${pkgdir}/usr/share/${pkgname}/app-update.yml'
    install -Dm644 '${pkgname}.desktop' '${pkgdir}/usr/share/applications/${pkgname}.desktop'
    install -Dm644 '${srcdir}/app/app.asar' '${pkgdir}/usr/share/${pkgname}/app.asar'
    cp -pvr '${srcdir}/app/extensions' '${pkgdir}/usr/share/${pkgname}/extensions'
    install -Dm755 '${pkgname}' '${pkgdir}/usr/bin/${pkgname}'
}
