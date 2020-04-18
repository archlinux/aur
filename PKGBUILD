# Maintainer: Kartik Mohta <kartikmohta@gmail.com>

pkgbase='python-rosinstall_generator'
pkgname=('python-rosinstall_generator')
_module='rosinstall_generator'
pkgver='0.1.19'
pkgrel=1
pkgdesc="A tool for generating rosinstall files"
url="http://wiki.ros.org/rosinstall_generator"
depends=('python' 'python-argparse' 'python-catkin_pkg' 'python-rosdistro' 'python-rospkg' 'python-yaml')
provides=('python-rosinstall-generator')
conflicts=('python2-rosinstall_generator' 'python-rosinstall-generator')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dcf4c6b179491fb51c40aca9a9217727f0848804cb4d4f00a8022a2e082493b7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
