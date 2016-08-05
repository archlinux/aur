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
source=("https://pypi.python.org/packages/b0/f6/8a64b94ce79589f54f0449e6c1f4ddb975482e3e04ddf22af2764b8d5fb9/dirlog-${pkgver}-py3-none-any.whl")
md5sums=('6e9b55375549ddd5376906d55709df1e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
