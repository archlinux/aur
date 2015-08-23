# Maintainer: Kozec <kozec at kozec dot com>

pkgname='pymclevel'
pkgver='0.1.8build799'
pkgrel=1
pkgdesc='Python library for reading Minecraft levels (version matched to MCEdit 
stable release)'
arch=('i686' 'x86_64')
url='https://github.com/mcedit/pymclevel'
license='BSD'
_commit="8bf7b3d76479e007a51f3055198a8bcddb626c84"

depends=('python2' 'python2-numpy' 'python2-yaml' 'python2-distribute')
makedepends=('cython2' 'unzip')
conflicts='pymclevel-git'

source=("https://github.com/mcedit/pymclevel/archive/${_commit}.zip")

build() {
	cd pymclevel-${_commit}
	python2 setup.py build
}


package() {
	cd pymclevel-${_commit}
	target="$pkgdir/usr/lib/python2.7/site-packages/pymclevel"
	python2 setup.py install --root="${pkgdir}"
	cp *.yaml "$target"
}

md5sums=('859764d44809b21f6945123ecc5d0710')
