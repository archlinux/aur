# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
pkgname=python-ros-cross-compile
_name=${pkgname:7}
__name=$(echo $_name | tr '-' '_')
pkgver=0.7.0
pkgrel=1
pkgdesc="A tool to build ROS workspaces for various target architectures and platforms."
arch=(any)
url="https://pypi.org/project/$_name"
license=('Apache')
depends=('python-docker' 'docker' 'qemu-user-static')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${__name}/${__name}-$pkgver.tar.gz)
sha256sums=('2011c4b3ef81b9164737a4e80998317244bfe695871d8ec252ab104e89f343db')

package() {
    cd ${srcdir}/${__name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
