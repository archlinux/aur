# with fixes by 0xAA <0xaa@dmg.sx>
pkgname="cgasm-git"
pkgver=20150721.8.4b72eb8
pkgrel=1
pkgdesc="Commandline IA32/AMD64 documentation"
arch=('i686' 'x86_64')
url="https://github.com/bnagy/cgasm"
license=('GPL2')
makedepends=('git' 'go')

source=("$pkgname"::"git://github.com/bnagy/cgasm.git")
md5sums=('SKIP')

pkgver () {
	_date=`date +"%Y%m%d"`
	cd "${srcdir}/${pkgname}"
	echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
	cd "${srcdir}/${pkgname}"
	go build
}

package() {
	cd "${srcdir}/${pkgname}"
	install -d -m755 "${pkgdir}/usr/bin"
	install -m755 cgasm-git "${pkgdir}/usr/bin/cgasm"
}
