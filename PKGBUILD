# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-package-selection
pkgver=0.2.1
pkgrel=1
pkgdesc="An extension for colcon-core to select a subset of packages for processing."
arch=(any)
url="https://pypi.org/project/colcon-package-selection"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/8f/56/a44e9c778905c2ed98101e8366460f9a4b5c13bad3aa0157627fe385dcc5/colcon-package-selection-$pkgver.tar.gz")
sha256sums=('04fc346341d599321cf4efd17da6730888142482e6ec721d6fc30a04d3750125')


package() {
    cd ${srcdir}/colcon-package-selection-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
