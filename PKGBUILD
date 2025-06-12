# Manitainer: grgergo <csakbek@freemail.hu>

pkgname='purple-instagram'
pkgver=master
pkgrel=2
epoch=1
pkgdesc='Instagram plugin for libpurple'
arch=('x86_64')
url='https://codeberg.org/grgergo/purple-instagram'
license=('GPL3')
depends=('libpurple' 'glib2' 'json-glib')

source=('git+https://github.com/EionRobb/purple-instagram'
        'install.sh'
				'signature.patch')
sha256sums=('SKIP'
            '557a23298b550a5c83cba572642f6095cef7827584dc0c7e1f459a42ac3cd0cb'
						'02e359cf08ef799028c83b7e7b91df853b2147fe54dc197103979b0069fc2385')

post_install='install.sh'

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
