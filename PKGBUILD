# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-bin
pkgver=0.5.7
pkgrel=5
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
license=('WTFPL')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
conflicts=('google-chat-linux-electron7-git')
appname="${pkgname%-bin}"

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("https://github.com/squalou/${appname}/releases/download/${pkgver}-${pkgrel}/${appname}_${pkgver}-${pkgrel}_amd64.deb")

sha512sums=('5716a4def941fce78c8d9582866e44703bf5b1a325716b6a26e8b482587a56f0cc147c73a66c2a81a1d0de75ac0becfd9eb635a8a3fb1a82ad3cabe5ef266fda')

build() {
  ar x "${appname}_${pkgver}-${pkgrel}_amd64.deb"
  tar xJf data.tar.xz
}

package() {
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mv "${srcdir}/opt" "${pkgdir}/opt"
}

