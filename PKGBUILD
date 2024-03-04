# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>
_pkgname=firmtool
pkgname=firmtool-git
pkgver=r42.fdc7085
pkgrel=1
pkgdesc="A tool to parse, extract, and build 3DS firmware files"
arch=('any')
url="https://github.com/TuxSH/firmtool"
license=('BSD')
depends=('python-pycryptodome')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/TuxSH/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}"
	python setup.py install --root="$pkgdir" --optimize=1
	mkdir -p "$pkgdir/usr/share/licenses/${pkgname}"
	cp LICENSE "$pkgdir/usr/share/licenses/${pkgname}/"
}
