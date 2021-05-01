# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-bin
pkgver=5.12.11
pkgrel=3
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
license=('WTFPL')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
conflicts=('google-chat-linux-electron7-git')
appname="${pkgname%-bin}"

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("https://github.com/squalou/${appname}/releases/download/${pkgver}-${pkgrel}/${appname}_${pkgver}-${pkgrel}_amd64.deb")

sha512sums=('f30b1ac30658bcb5c15a6e982a03fb99ede3a9d48ee584ec6e54ac0c93f0682bef1f19e4b27bb7276bf75c5f7af8a70b1b8407e969209330155a8a1b3bdfda3f')

build() {
  ar x "${appname}_${pkgver}-${pkgrel}_amd64.deb"
  tar xJf data.tar.xz
}

package() {
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mv "${srcdir}/opt" "${pkgdir}/opt"
}

