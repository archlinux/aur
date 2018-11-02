#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-defaults
pkgver=0.2.1
pkgrel=1
pkgdesc="An extension for colcon-core to provide custom default values for the command line arguments from a configuration file."
arch=(any)
url="https://pypi.org/project/colcon-defaults/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/18/e2/73754aa6fadf31b56656d6cb467bce159961b29a810820e8d37b8843a17e/colcon-defaults-$pkgver.tar.gz")
sha256sums=('0afa9391399f056edf0f3247204c9d9b6cebe3de17c0fc5fba163d5a35954695')


package() {
    cd ${srcdir}/colcon-defaults-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
