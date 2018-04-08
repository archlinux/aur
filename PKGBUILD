# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>

pkgname='python-onkyo-eiscp-git'
_pkgname=onkyo-eiscp
pkgver=1.2.4.r8.gce9f8b0
pkgrel=1
pkgdesc="Control Onkyo receivers over ethernet."
arch=('any')
url='https://github.com/miracle2k/onkyo-eiscp'
license=('custom:MIT')
makedepends=('git' 'python-setuptools')
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

package_python-onkyo-eiscp-git() {
  depends=('python' 'python-docopt' 'python-netifaces')
  cd $_pkgname
  python setup.py install --root=${pkgdir} --optimize=1
  install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/python-onkyo-eiscp-git
}
