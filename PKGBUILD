# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=termsaver-git 
pkgver=r126.cf2410b
pkgrel=1
pkgdesc="Simple text-based Terminal Screensaver"
arch=('x86_64')
url="http://termsaver.brunobraga.net/"
license=('GPL')
depends=('python3' 'python-pillow')
makedepends=('git') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/brunobraga/termsaver.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python3 setup.py install --prefix "$pkgdir/usr/"
}
