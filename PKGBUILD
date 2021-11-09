# Contributor: Wilson Birney <wpbirney@gmail.com>
pkgname=pirate-get-git
pkgver=r335.608cb0a
pkgrel=1
pkgdesc="a command line interface for thepiratebay"
arch=('any')
url="https://github.com/vikstrous/pirate-get"
license=('AGPL')
depends=('python-pyperclip' 'python-colorama' 'python-veryprettytable' 'python-termcolor')
makedepends=('git' 'python-setuptools') 
provides=(pirate-get)
conflicts=(pirate-get)
source=('git+https://github.com/vikstrous/pirate-get.git')
md5sums=('SKIP')

pkgver() {
	cd pirate-get
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd pirate-get
	python setup.py build
}

package() {
	cd pirate-get
	python setup.py install --root="$pkgdir" --optimize=1
}
