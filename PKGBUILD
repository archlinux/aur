#Maintainer: Tong Chunli<t.cunly at 163 dot com>
pkgname=python-colcon-ros
pkgver=0.3.10
pkgrel=1
pkgdesc="An extension for colcon-core to support ROS packages."
arch=(any)
url="https://pypi.org/project/colcon-ros/"
license=('Apache')
depends=('python-colcon-core' 'python-colcon-library-path' 'python-colcon-cmake' 'python-colcon-pkg-config' 'python-colcon-recursive-crawl' 'python-colcon-python-setup-py' 'python-pyparsing' 'python-catkin_pkg')
makedepends=('python-setuptools')
source=(https://files.pythonhosted.org/packages/bd/70/d9e688261bf824546426120cb8e87375114bcaa98364d0fc0cb68937330e/colcon-ros-0.3.10.tar.gz)
sha256sums=('e560084af1f8aa059e7ea579357904137ede59b8083562bdd6e39f2db147143f')


package() {
    cd ${srcdir}/colcon-ros-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
