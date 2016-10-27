# Maintainer: Sergey Porivaev <porivaevs at gmail dot com>

pkgname=whereami-git
pkgver=r49.a782f9e
pkgrel=1
pkgdesc='Uses WiFi signals and machine learning to predict where you are'
arch=('any')
url='https://github.com/kootenpv/whereami'
license=('MIT')
depends=('python' 'python-access_points' 'python-tqdm' 'python-scikit-learn')
makedepends=('git')
provides=('whereami')
conflicts=('whereami')
source=('git+https://github.com/kootenpv/whereami')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1
}
