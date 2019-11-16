# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosinstall_generator'
pkgname=('python-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.18'
pkgrel=2
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
provides=('python-rosinstall-generator')
conflicts=('python2-rosinstall_generator' 'python-rosinstall-generator')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dfcededd5046c687d80ea69128e89aa854e9d723f97e4c39a810a1dc94f7c1a2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
