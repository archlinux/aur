# Maintainer: Romain Sidhoum <echo cm9tYWluLnNpZGhvdW1AZ21haWwuY29tCg== | base64 -d>

_pkgname=chameleon
pkgname=chameleon-git
pkgver=r10.8643e5e
pkgrel=1
pkgdesc="A color picker for X11 written in python"
arch=('any')
url="https://github.com/seebye/${_pkgname}"
license=('GPL3')

depends=(
         'python>=3.5.0'
         'python-xlib'
         'python-pillow'
         'python-docopt'
         'python-setuptools'
        )

makedepends=('git')

source=("git://github.com/seebye/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	python setup.py install --root="$pkgdir"
}
