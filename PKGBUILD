pkgname=moonshine
pkgver=0.2.1
pkgrel=1

pkgdesc="A lightweight Lua VM for the browser"
url="http://moonshinejs.org"
arch=('any')
license=('GPL3')

depends=('lua' 'nodejs')
makedepends=('npm')

source=(moonshine-"$pkgver".tar.gz::https://github.com/gamesys/moonshine/archive/"$pkgver".tar.gz)

noextract=("$pkgver.tgz")

sha1sums=('4ea6a621bdc6778b165e91571293c990617371b2')

package() {
	npm install -g --prefix "$pkgdir"/usr moonshine-"$pkgver".tar.gz
	install -D "$pkgdir"/usr/lib/node_modules/moonshine/bin/man/*.1 \
	           "$pkgdir"/usr/share/man/man1/
	chown -R root:root "$pkgdir"/usr
}
