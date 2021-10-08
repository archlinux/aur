# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: incomplete <incomplete at axion dot co>
# Contributor: ribbons <aur dot ribbons at codefive dot co dot uk>

pkgname=python-vispy
pkgver=0.9.0
pkgrel=1
pkgdesc='A high-performance interactive 2D/3D data visualization library.'
arch=('any')
url='http://vispy.org'
license=('BSD')
depends=('python-numpy' 'python-hsluv' 'python-freetype-py' 'python-kiwisolver')
makedepends=('python-setuptools' 'cython' 'npm')
optdepends=('pyside2: a possible backend'
            'python-pyqt5: a possible backend')
_pkgname=vispy
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vispy/vispy/archive/v$pkgver.tar.gz")
sha256sums=('bfd85ac6c4c9555ec29e92bfe2652c89a1824134853ef4827c1cf007a3f6cca5')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
