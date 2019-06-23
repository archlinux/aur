# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-argcomplete
pkgver=0.3.2
pkgrel=1
pkgdesc="An extension for colcon-core to provide command line completion using argcomplete."
arch=(any)
url="https://pypi.org/project/colcon-argcomplete"
license=('Apache')
depends=('python-colcon-core' 'python-argcomplete')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/3d/e7/bdff37dd01b9900eff52cbc3c45519277a49f94238a50ed6c9c4f205edf4/colcon-argcomplete-0.3.2.tar.gz)
sha256sums=('794c4a730de1e362828307a7abcfa9938404338bfde96ae4f6c5463429c690da')


package() {
    cd ${srcdir}/colcon-argcomplete-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 || echo "NOT A PROBLEM"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
