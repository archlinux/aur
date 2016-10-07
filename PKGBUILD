pkgname=python2-spotipy
_pkgname=spotipy
pkgver=2.3.8
pkgrel=1
pkgdesc='Simple client for the Spotify Web API'
arch=('any')
url="https://github.com/plamere/spotipy"
license=('MIT')
depends=('python2' 'python2-requests>=1.0')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

md5sums=('0248576e241f74f08297dd7c76b0cc67')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
