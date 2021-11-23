pkgbase='python-jupyter-server-proxy'
pkgname=('python-jupyter-server-proxy')
_module='jupyter-server-proxy'
pkgver='3.1.0'
pkgrel=1
pkgdesc="Jupyter server extension to supervise and proxy web services"
url="https://github.com/jupyterhub/jupyter-server-proxy"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('30d57976090980f4380cb0a80e8e829dfd74d0a19edb64329239def9feefcde4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
