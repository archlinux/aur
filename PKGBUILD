# Maintainer: Alisoftware <admin@situsali.com>

pkgname=telegram-cli-bin
pkgver=1222
_pkgname=telegram-cli-1222
pkgrel=1
pkgdesc="Telegram messenger CLI"
arch=('x86_64')
url="https://github.com/vysheng/tg"
license=('GPL2')
depends=('libconfig' 'libevent' 'lua' 'jansson' 'lua52')
makedepends=('git')
conflicts=('telegram-cli')
provides=('telegram-cli')

source=("$_pkgname"::'https://valtman.name/files/telegram-cli-1222')
sha256sums=('SKIP')

build (){
	if [ ! -f /usr/lib/libreadline.so.6 ]; then
		ln -s /usr/lib/libreadline.so.7 /usr/lib/libreadline.so.6
	fi
	if [ ! -f /usr/lib/liblua5.2.so.0 ]; then
		ln -s /usr/lib/liblua5.2.so /usr/lib/liblua5.2.so.0
	fi	
}

package() {
    cd "$srcdir"
    install -Dm755 ${_pkgname} ${pkgdir}/usr/bin/telegram-cli
}
