pkgbase='python-ikernel-remote'
pkgname=('python-ikernel-remote')
_module='ikernel_remote'
pkgver='1.0.1'
pkgrel=1
pkgdesc="Running IPython kernels remotely and through batch queues"
url="https://github.com/macdems/ikernel_remote"
depends=('python' 'python-pexpect' 'jupyter-notebook')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('255ba3c80b8d0ed9e78b8b70c47074b291e37eef886f515d812a87b9d0e2c0e6')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
