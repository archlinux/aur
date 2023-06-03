# Manitainer: grgergo <csakbek@freemail.hu>

pkgname='purple-instagram'
pkgver=master
pkgrel=1
epoch=1
pkgdesc='Instagram plugin for libpurple'
arch=('x86_64')
url='https://codeberg.org/grgergo/purple-instagram'
license=('GPL3')
depends=('libpurple' 'glib2' 'json-glib')

source=('git+https://codeberg.org/grgergo/purple-instagram'
        'install.sh')
sha256sums=('SKIP'
            '557a23298b550a5c83cba572642f6095cef7827584dc0c7e1f459a42ac3cd0cb')

post_install='install.sh'

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
