# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=termsaver-git 
pkgver=r125.5a683f7
pkgrel=1
pkgdesc="Simple text-based Terminal Screensaver"
arch=('i686' 'x86_64')
url="http://termsaver.brunobraga.net/"
license=('GPL')
depends=('python3')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()
install=
source=("${pkgname%-git}::git://github.com/brunobraga/termsaver.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py install --prefix "$pkgdir/usr/"
}
