# Maintainer: Patrick Rogers <patrick@thewebzone.net>
pkgname=python-captionstransformer-git
_gitname='captionstransformer'
pkgver=r29.6e33cab
pkgrel=1
pkgdesc="Set of tools to transform captions from one format to another"
arch=('any')
url="https://github.com/toutpt/captionstransformer"
license=('GPL2')
depends=('python' 'python-setuptools' 'python-beautifulsoup4' 'python-soupsieve')
makedepends=('git')
provides=("python-captionstransformer")
conflicts=("python-captionstransformer")
source=('git+https://github.com/toutpt/captionstransformer.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${_gitname}"
	python setup.py install --root="${pkgdir}"
}
