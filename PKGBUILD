# Maintainer: Achmad Fathoni<fathoni.id(at)gmail.com>
# Contributor: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-ros
_name=${pkgname:7}
pkgver=0.3.22
pkgrel=1
pkgdesc="An extension for colcon-core to support ROS packages."
arch=(any)
url="https://pypi.org/project/colcon-ros/"
license=('Apache')
depends=('python-colcon-core' 'python-colcon-library-path' 'python-colcon-cmake' 'python-colcon-pkg-config' 'python-colcon-recursive-crawl' 'python-colcon-python-setup-py' 'python-pyparsing' 'python-catkin_pkg')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('c22124e018930427ae66faaa77777adddbb5e8d7790e60711f012b3a43ceda01')


package() {
    cd ${srcdir}/${_name}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
