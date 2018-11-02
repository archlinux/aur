# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-package-information
pkgver=0.2.1
pkgrel=1
pkgdesc="An extension for colcon-core to provide information about the packages."
arch=(any)
url="https://pypi.org/project/colcon-package-information/"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/70/54/1d3d1aa86a6b9e53155665e04d2b177051145aaeea598ac0ba2ecc47d48a/colcon-package-information-$pkgver.tar.gz")
sha256sums=('906f40e468fe7ee2a9c7bbbdb73efa37e85a59faaa7c141446fd350ed23deefb')


package() {
    cd ${srcdir}/colcon-package-information-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
