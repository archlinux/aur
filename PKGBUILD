pkgbase=('python-fuocore')
pkgname=('python-fuocore')
_module='fuocore'
pkgver='2.0.2'
pkgrel=1
pkgdesc="feeluown core"
url="https://github.com/cosven/feeluown-core"
depends=('python' 'mpv' 'python-beautifulsoup4' 'python-marshmallow' 'python-crypto' 'python-requests' 'python-mutagen' 'python-fuzzywuzzy')
makedepends=('git' 'python-setuptools')
provides=("${pkgname}=${pkgver}")
license=('MIT')
arch=('any')
source=("${pkgname}"::'git://github.com/cosven/feeluown-core.git')
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
