# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>

pkgname=python-moderngl-git
pkgdesc="Modern OpenGL binding for python."
pkgver=20170726
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/cprogrammer1994/ModernGL"
license=('MIT')
groups=()
depends=('python' 'libgl')
makedepends=('git')
options=(!emptydirs)
source=("git+https://github.com/cprogrammer1994/ModernGL.git")
md5sums=('SKIP')

pkgver() {
	cd ModernGL
	git log --format="%cd" --date=short -1 | sed 's/-//g'
}

build() {
	cd ModernGL
	python setup.py build
}

package() {
	cd ModernGL
	python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: shiftwidth=2 softtabstop=2 tabstop=2 noexpandtab
