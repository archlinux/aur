#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-metadata
pkgver=0.2.1
pkgrel=1
pkgdesc="An extension for colcon-core to fetch and manage package metadata from repositories."
arch=(any)
url="https://pypi.org/project/colcon-metadata/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/14/30/25c40b5c20650d95cf343fff27155fdeb1356bfdc4638c81fe29af432ec4/colcon-metadata-$pkgver.tar.gz")
sha256sums=('bf96f93136dc2ff9417590dc83a69b29f7811f13b6e2d8959abf8d52a0549ffe')


package() {
    cd ${srcdir}/colcon-metadata-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
