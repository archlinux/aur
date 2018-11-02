# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-argcomplete
pkgver=0.2.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide command line completion using argcomplete."
arch=(any)
url="https://pypi.org/project/colcon-argcomplete"
license=('Apache')
depends=('python-colcon-core' 'python-argcomplete')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/9a/c6/14b2ec6eff251551d987b39ad6d7e5fe0426aeb22ef2c7584957449e820a/colcon-argcomplete-$pkgver.tar.gz")
sha256sums=('0ea8014adf800cc0be0d9865a987430b903fb7c6569c087bb5b9618d7aa543ad')


package() {
    cd ${srcdir}/colcon-argcomplete-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 || echo "NOT A PROBLEM"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
