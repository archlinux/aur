pkgbase=('python-fuocore')
pkgname=('python-fuocore')
_module='fuocore'
pkgver='2.3'
pkgrel=1
pkgdesc="feeluown core"
url="https://github.com/cosven/feeluown-core"
depends=('python' 'mpv' 'python-beautifulsoup4' 'python-marshmallow' 'python-crypto' 'python-requests' 'python-mutagen' 'python-fuzzywuzzy')
makedepends=('python-setuptools')
provides=("${pkgname}=${pkgver}")
license=('MIT')
arch=('any')
source=("${pkgname}"::'https://files.pythonhosted.org/packages/59/61/4ecaf91c6075d468f0343747565489bb65d3ef0238ec5176381121ae5ab4/fuocore-2.3.tar.gz')
sha256sums=('ad0f0d6f8c96fe0a46d2fa658515f50613e8daa8cce56eece58d702d1e9e4d51')
dirname="fuocore-${pkgver}"

build() {
    cd "${srcdir}/${dirname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${dirname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
