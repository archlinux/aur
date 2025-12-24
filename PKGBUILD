# Maintainer: dsrodrigues20 <dsrodrigues20@gmail.com>
pkgname=auto-claude-bin
pkgver=2.7.1
pkgrel=1
pkgdesc="Automação inteligente para Claude AI"
arch=('x86_64')
url="https://github.com/AndyMik90/Auto-Claude"
license=('MIT')
depends=('electron' 'libnotify' 'libappindicator-gtk3')
provides=('auto-claude')
conflicts=('auto-claude')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::https://github.com/AndyMik90/Auto-Claude/releases/download/v${pkgver}/auto-claude_${pkgver}_amd64.deb")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    cd "${srcdir}"

    # Extrair o .deb
    bsdtar -xf "${pkgname}-${pkgver}.deb"

    # Extrair data.tar (pode ser .xz, .gz ou .zst)
    if [[ -f "data.tar.xz" ]]; then
        bsdtar -xf "data.tar.xz" -C "${pkgdir}"
    elif [[ -f "data.tar.gz" ]]; then
        bsdtar -xf "data.tar.gz" -C "${pkgdir}"
    elif [[ -f "data.tar.zst" ]]; then
        bsdtar -xf "data.tar.zst" -C "${pkgdir}"
    elif [[ -f "data.tar" ]]; then
        bsdtar -xf "data.tar" -C "${pkgdir}"
    fi
}
