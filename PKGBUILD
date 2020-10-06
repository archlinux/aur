# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-bin
pkgver=0.5.5
pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
license=('WTFPL')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
conflicts=('google-chat-linux-electron7-git')
appname="${pkgname%-bin}"

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("https://github.com/squalou/${appname}/releases/download/${pkgver}-${pkgrel}/${appname}_${pkgver}-${pkgrel}_amd64.deb")

sha512sums=('709f33dd4e8e629694eca9b45625f8cacabf2fa4c91211528ebc32660cd812d2c563629e0d7563d3682c57fd82bfe4e2eb0960a6c64dc0609c075abd427a2bc0')

build() {
  ar x "${appname}_${pkgver}-${pkgrel}_amd64.deb"
  tar xJf data.tar.xz
}

package() {
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mv "${srcdir}/opt" "${pkgdir}/opt"
}

