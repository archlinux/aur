# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ros-cross-compile
_name=${pkgname:7}
__name=$(echo $_name | tr '-' '_')
pkgver=0.10.0
pkgrel=1
pkgdesc="A tool to build ROS workspaces for various target architectures and platforms."
arch=(any)
url="https://pypi.org/project/$_name"
license=('Apache')
depends=('python-docker' 'docker' 'qemu-user-static')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${__name}/${__name}-$pkgver.tar.gz)
sha256sums=('0d55cb2fd9220de86f5719c5df675ed0a1a88be180495ec6ec57f2cb7efd4cfe')

package() {
    cd ${srcdir}/${__name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
