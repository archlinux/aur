# Maintainer: Phil Schaf <flying-sheep@web.de>
_gitname=IPython-notebook-extensions
pkgname=jupyter-nbextensions-git
pkgver=0.0.1267.600d4da
pkgrel=1
pkgdesc='Some extensions for Jupyter notebook'
arch=(any)
url=https://github.com/ipython-contrib/$_gitname
license=(BSD)
conflicts=(jupyter-nbextensions python-jupyter-nbextensions)
depends=(python jupyter jupyter-notebook jupyter-nbconvert)
source=("git://github.com/jcb91/$_gitname.git" $pkgname.install)
install=$pkgname.install
md5sums=(SKIP 4e48a57d9ec7eab953d62cb3a3cba951)

pkgver() {
	cd $_gitname
	echo 0.0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
	cd "$srcdir/$_gitname"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
