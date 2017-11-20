# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>

pkgname=('python-onkyo-eiscp-git' 'python2-onkyo-eiscp-git')
_pkgname=onkyo-eiscp
pkgver=1.2.4.r4.g1ebfb08
pkgrel=2
pkgdesc="Control Onkyo receivers over ethernet."
arch=('any')
url='https://github.com/miracle2k/onkyo-eiscp'
license=('custom:MIT')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
options=()
source=('git://github.com/miracle2k/onkyo-eiscp.git')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build_python-onkyo-eiscp-git() {
  cd $_pkgname
  python setup.py build
}

build_python2-onkyo-eiscp-git() {
  cd $_pkgname
  python2 setup.py build
}

package_python-onkyo-eiscp-git() {
  depends=('python' 'python-docopt' 'python-netifaces')
  cd $_pkgname
  python setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python-onkyo-eiscp-git
}

package_python2-onkyo-eiscp-git() {
  depends=('python2' 'python2-docopt' 'python2-netifaces')
  cd $_pkgname
  python2 setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python2-onkyo-eiscp-git
}
