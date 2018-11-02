#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-ros
pkgver=0.3.5
pkgrel=1
pkgdesc="An extension for colcon-core to support ROS packages."
arch=(any)
url="https://pypi.org/project/colcon-ros/"
license=('Apache')
depends=('python-colcon-core' 'python-colcon-library-path' 'python-colcon-cmake' 'python-colcon-pkg-config' 'python-colcon-recursive-crawl' 'python-colcon-python-setup-py' 'python-pyparsing' 'python-catkin_pkg')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/a7/4b/6e0ff8da4e6e4886c22138088ff9974b489c51a2de212efad53715cd7fa1/colcon-ros-$pkgver.tar.gz")
sha256sums=('1a8c4acb3f0c211a8a436364b7881ad525cae18ea6726f2185cb9995573ff62e')


package() {
    cd ${srcdir}/colcon-ros-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
