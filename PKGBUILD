# Maintainer: Simon Tas <simon.tas.st@gmail.com>

pkgname="deemix-git"
_pkgname="deemix"
pkgver=r274.fd148d4
pkgrel=1
pkgdesc="a deezer downloader built from the ashes of Deezloader Remix."
arch=('any')
url="https://notabug.org/RemixDev/$_pkgname"
license=('gpl3')
depends=('python>=3.6' 'python-click' 'python-pycryptodomex' 'python-mutagen' 'python-requests'  'python-spotipy')
conflicts=('deemix')
makedepends=('git')
provides=('deemix')
source=("${_pkgname}::git+https://notabug.org/RemixDev/$_pkgname")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${_pkgname}
		python setup.py build
}

package() {
	cd ${srcdir}/${_pkgname}
    
	python setup.py install --root="${pkgdir}" --optimize=1
}
 
