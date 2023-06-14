# Maintainer: Squalou <squalou.jenkins [at] gmail [dot] com>
pkgname=google-chat-linux-bin
pkgver=5.24.19
pkgrel=4
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron included"
arch=('x86_64' 'i686')
url="https://github.com/squalou/google-chat-linux.git"
license=('WTFPL')
makedepends=('nodejs' 'npm' 'xz' 'binutils')
depends=('xdg-desktop-portal')
conflicts=('google-chat-linux-electron7-git')
appname="${pkgname%-bin}"

[[ $CARCH == 'x86_64' ]] && _arch='x64' || _arch='ia32'

source=("https://github.com/squalou/${appname}/releases/download/${pkgver}-${pkgrel}/${appname}_${pkgver}-${pkgrel}_amd64.deb")

sha512sums=('281a719b439faaefecba91247c8dea0718aa5e111b21fdb210f54afc71663ef951d1a04b14f684a497484e8d9da47862cfe4acf575e3148f1126ba77716731fd')

build() {
  ar x "${appname}_${pkgver}-${pkgrel}_amd64.deb"
  tar xJf data.tar.xz
}

package() {
    mv "${srcdir}/usr" "${pkgdir}/usr"
    mv "${srcdir}/opt" "${pkgdir}/opt"
}

