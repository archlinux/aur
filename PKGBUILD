# Maintainer: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5-git
pkgver=0.74.0.r5.g59c90b5
pkgrel=1
pkgdesc='Python binding to libpoppler-qt5.'
arch=('any')
url='https://github.com/frescobaldi/python-poppler-qt5'
license=('LGPL')
depends=('python' 'python-pyqt5' 'poppler-qt5')
makedepends=('git' 'python-sip' 'sip')
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
source=(${pkgname}::'git+https://github.com/wbsoft/python-poppler-qt5.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${pkgname}"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
