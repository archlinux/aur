# Maintainer: Kenneth Lyons (ixjlyons) <ixjlyons@gmail.com>

pkgname=python-poppler-qt5-git
pkgver=r18.dd3dacb
pkgrel=1
pkgdesc='Python binding to libpoppler-qt5.'
arch=('any')
url='https://github.com/wbsoft/python-poppler-qt5'
license=('LGPL')
depends=('python' 'python-pyqt5' 'poppler-qt5')
makedepends=('git' 'python-sip')
provides=('python-poppler-qt5')
conflicts=('python-poppler-qt5')
source=(${pkgname}::'git+https://github.com/wbsoft/python-poppler-qt5.git')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${pkgname}"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
}
