# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-spritex
_module=spritex
pkgver=0.1.3
pkgrel=1
pkgdesc="A simple tool for extracting sprites from full frames. Useful for AI projects. "
url="https://github.com/codetorex/spritex"
depends=('python' 'python-numpy' 'python-kivy' 'python-pillow' 'xclip')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/codetorex/spritex/archive/${pkgver}.tar.gz")
#source=("https://files.pythonhosted.org/packages/source/s/spritex/spritex-${pkgver}.tar.gz")
md5sums=('1f276da550ffc52447731cd4976ea941')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
