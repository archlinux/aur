# Maintainer: deadc0de6 <info@deadc0de.ch>

_pkgname=catcli
pkgname="${_pkgname}-git"
pkgver=0.5.4.r0.gc69cd67
pkgrel=1
pkgdesc="The command line catalog tool for your offline data"
arch=('any')
url="https://github.com/deadc0de6/catcli"
license=('GPL')
groups=()
depends=('python' 'python-setuptools' 'python-docopt' 'python-anytree' 'python-psutil')
makedepends=('git')
provides=(catcli)
conflicts=(catcli)
source=("git+https://github.com/deadc0de6/catcli.git")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

