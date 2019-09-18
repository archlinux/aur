# Maintainer: Christian Mauderer <oss@c-mauderer.de>

_name='click-datetime'
pkgname='python-click-datetime'
pkgver='0.2.0'
pkgrel=1
pkgdesc='Click support for Python’s Datetime types.'
arch=('any')
url='https://github.com/click-contrib/click-datetime'
license=('MIT')
depends=('python' 'python-click')
makedepends=('python-setuptools')
source=("https://github.com/click-contrib/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('b17eec36bcee5f9055f9b716ab0e2125be4f95b9b988fd04ea07ec95a57f26d9d2d4ee2bd879b59730e3f6899ec63285a28af01e7a86fd7a980b1a78d682e482')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
