# Maintainer: Yiyao Yu <yuydevel at protonmail dot com>

_pkgname=musct
pkgname="${_pkgname}-git"
pkgver=0.0.r0.0
pkgrel=1
pkgdesc="Simple configuration unpacker written in python"
license=('GPL3')
url="https://gitlab.com/xythrez/musct"
arch=('any')
provides=('musct')
conflicts=('musct')
makedepends=('git')
optdepends=('libyaml: For native yaml parsing')
depends=('python' 'python-setuptools' 'python-pyaml')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver(){
  git -C "${_pkgname}" describe --long --tags | sed "s/-/.r/;s/-/./g"
}

package(){
  cd $_pkgname
  python setup.py install -O1 --root="$pkgdir"
}
