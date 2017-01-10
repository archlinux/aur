pkgbase=('python-fastcache')
pkgname=('python-fastcache')
_module='fastcache'
pkgver='1.0.2'
pkgrel=1
pkgdesc="C implementation of Python 3 functools.lru_cache."
url="https://github.com/pbrady/fastcache"
depends=('python')
makedepends=('python-setuptools')
license=('GPL3')
arch=('i686' 'x86_64')
source=("https://pypi.python.org/packages/fb/98/93f2d36738868e8dd5a8dbfc918169b24658f63e5fa041fe000c22ae4f8b/fastcache-1.0.2.tar.gz")
md5sums=('1c301bedd2be2ae48d9c853ca7719e19')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
