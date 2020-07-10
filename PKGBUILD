# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
_name='scikit-video'
pkgname="python-${_name}"
pkgver=1.1.11
pkgrel=2
pkgdesc="Video processing built on top of scipy, numpy, and ffmpeg/libav"
arch=('i686' 'x86_64')
url="http://www.${_name}.org/"
license=('BSD' 'custom')
depends=('ffmpeg' 'python-scikit-learn' 'python-pillow')
optdepends=('mediainfo')
source=(https://github.com/${_name}/${_name}/archive/${pkgver}.tar.gz)
sha256sums=('0d28d9c08d43be56bd723c8387e90e599a5ce4b75c389717d190ccde0ef5d56f')

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
}
