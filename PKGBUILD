pkgname='python-paramiko-expect'
_module='paramiko-expect'
_src_folder='paramiko-expect-0.3.5'
pkgver='0.3.5'
pkgrel=2
pkgdesc="An expect-like extension for the Paramiko SSH library"
url="https://github.com/fgimian/paramiko-expect"
depends=('python'
         'python-paramiko>=1.10.1'
         )
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/${_module//-/_}/${_module}-$pkgver.tar.gz")
sha256sums=('45e107bc16ed68bd2f8878c3838be748d2e7969313dcb1bba9123eb2f603ad01')

build() {
    cd "${srcdir}/${_src_folder}"
    python setup.py build
}

package() {

    cd "${srcdir}/${_src_folder}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
