# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ros-cross-compile
_name=${pkgname:7}
__name=$(echo $_name | tr '-' '_')
pkgver=0.8.0
pkgrel=1
pkgdesc="A tool to build ROS workspaces for various target architectures and platforms."
arch=(any)
url="https://pypi.org/project/$_name"
license=('Apache')
depends=('python-docker' 'docker' 'qemu-user-static')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${__name}/${__name}-$pkgver.tar.gz)
sha256sums=('a39d378dcf98dd720927436057cbdbe59e87b1d283e1379ebad4918ce3e0815c')

package() {
    cd ${srcdir}/${__name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
