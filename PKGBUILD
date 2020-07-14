# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-git
pkgver=0.5.2
pkgrel=2
up_pkgrel=1
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
license=('WTFPL')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
conflicts=('google-chat-linux-electron7-git')
appname="${pkgname%-git}"

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("${pkgname%}::git+${url}#branch=master")
source=("https://github.com/squalou/${appname}/releases/download/${pkgver}-${up_pkgrel}/${appname}_${pkgver}-${up_pkgrel}_amd64.deb")

sha256sums=('b102f8799fb45e2a2dfc69cca89db5e0c5cdd2e13f710a3aa703b2aef63b2244')

build() {
  ar x "${appname}_${pkgver}-${up_pkgrel}_amd64.deb"
  tar xJf data.tar.xz
}

package() {
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mv "${srcdir}/opt" "${pkgdir}/opt"
}

