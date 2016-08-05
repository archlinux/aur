pkgbase=('python-dirlog')
pkgname=('python-dirlog')
_module='dirlog'
pkgver='0.2.9'
pkgrel=1
pkgdesc="keep a log of directories you visit to get back fast"
url="https://github.com/ninjaaron/dirlog"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://pypi.python.org/packages/ab/f4/ec2aaefe58669d6181d36823e656d3f48984b5a56d81e96dd1c4dc4cade9/dirlog-${pkgver}.tar.gz")
md5sums=('5a19b5dce93e47d65546a952a24551b5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
