# Maintainer: Hoang Nguyen <toi at doclai dot com>

_pkgname=nchat
pkgname=${_pkgname}
pkgver=4.13
pkgrel=1
pkgdesc="nchat is a console-based chat client for Linux and macOS with support for Telegram."
arch=('any')
url="https://github.com/d99kris/nchat"
license=('MIT')
depends=('ncurses' 'ccache' 'cmake' 'gperf' 'help2man' 'readline' 'openssl' 'zlib'  'sqlite' 'go' 'file')

provides=('nchat')
conflicts=('nchat' 'nchat-git')
source=("v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
	bash ./make.sh build
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
	make DESTDIR="${pkgdir}" install
}
