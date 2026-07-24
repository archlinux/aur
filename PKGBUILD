# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-bin
pkgver=5.39.26
pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
license=('WTFPL')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
depends=('xdg-desktop-portal')
conflicts=('google-chat-linux-electron7-git')
install="${pkgname}.install"
appname="${pkgname%-bin}"

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("https://github.com/squalou/${appname}/releases/download/${pkgver}-${pkgrel}/${appname}_${pkgver}-${pkgrel}_amd64.deb")

sha512sums=('8d317f510b69c94c96701f02a81423196342ddfebeeb0557c215acf9396a4a2a6be5b289445d6533b044dd3b00fd2af9c24fb2e7cfa4b552a88826c8445ffe9e')

build() {
  ar x "${appname}_${pkgver}-${pkgrel}_amd64.deb"
  tar xJf data.tar.xz
}

package() {
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mv "${srcdir}/opt" "${pkgdir}/opt"
}

