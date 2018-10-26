pkgname=python2-spotipy
_pkgname=spotipy
pkgver=2.4.4
pkgrel=1
pkgdesc='Simple client for the Spotify Web API'
arch=('any')
url="https://github.com/plamere/spotipy"
license=('MIT')
depends=('python2' 'python2-requests>=1.0')
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")

md5sums=('e9b895c8351d440af49470f9f3f9f4f4')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
