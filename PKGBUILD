# Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-notification
pkgver=0.2.8
pkgrel=1
pkgdesc="An extension for colcon-core to provide status notifications."
arch=(any)
url="https://pypi.org/project/colcon-notification"
license=('Apache')
depends=('python-colcon-core')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/fc/a7/1944423a15ca14904f45ab504fe5aebcf7430933772637b769998d90a718/colcon-notification-0.2.8.tar.gz)
sha256sums=('3467248415f6acc8f434b3b36b875be3efa76e1166b95852881d9768e6f41c06')


package() {
    cd ${srcdir}/colcon-notification-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 || echo "Not A Problem"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
