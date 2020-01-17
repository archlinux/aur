# Maintainer: Shane "SajeOne" Brown <contact@shane-brown.ca>
pkgname=python-spotipy-git
_pkgname=spotipy
pkgver=r406.6da643e
pkgrel=2
pkgdesc='Simple client for the Spotify Web API'
arch=('any')
url="https://github.com/plamere/spotipy"
license=('MIT')
provides=('python-spotipy')
depends=('python' 'python-requests>=1.0' 'python-simplejson')
makedepends=('python' 'python-setuptools')
source=("spotipy::git+https://github.com/plamere/spotipy.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"
	python setup.py install --root="${pkgdir}/" --optimize=1

	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
