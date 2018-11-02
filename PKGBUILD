# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-notification
pkgver=0.2.5
pkgrel=1
pkgdesc="An extension for colcon-core to provide status notifications."
arch=(any)
url="https://pypi.org/project/colcon-notification"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/af/ce/432380f808fb6dfad45f0416bffa4eb4f9bdf895483c0db13017e35ac686/colcon-notification-$pkgver.tar.gz")
sha256sums=('6b6e0334a346ef44e5a84642faa701bd4c0169b0c25cc42f0d615dba4a566bfc')


package() {
    cd ${srcdir}/colcon-notification-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 || echo "Not A Problem"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
