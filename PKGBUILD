# Maintainer: trougnouf (Benoit Brummer) < trougnouf at gmail dot com >
_name='cmapy'
pkgname="python-${_name}"
pkgver=0.6.6
pkgrel=2
pkgdesc="Use Matplotlib colormaps with OpenCV in Python"
arch=('i686' 'x86_64')
url="https://gitlab.com/cvejarano-oss/${_name}"
license=('MIT')
depends=('opencv' 'python-matplotlib')
makedepends=('python-setuptools')
source=("${url}/-/archive/v${pkgver}/${_name}-v${pkgver}.tar.bz2")
sha256sums=('be72b1dd1916b64aa1d5c4f0022bc212e9f316f02e097e5c595639260b8c7d66')

build() {
    cd ${srcdir}/${_name}-v${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_name}-v${pkgver}
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --skip-build
}

