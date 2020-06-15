# Maintainer: Zachary Ashen <zachary.h.a@gmail.com>
pkgname=noted-cli-git
pkgver=0.1.4
pkgrel=1
pkgdesc="Noted is a cli note taking and todo app similar to google keep or any other note taking service. It is a fork of my previous project keep-cli. Notes appear as cards. You can make lists and write random ideas."
arch=(x86_64 i686)
url="https://github.com/zack-ashen/noted"
license=('MIT')
depends=(python)
makedepends=(python-setuptools git)
provides=(noted-cli-git)
conflicts=(noted-cli-git)
source=(git+$url)
md5sums=('SKIP')

_pkgname=noted

pkgver() {
  cd "${_pkgname}"
  printf "0.1.4.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
	msg "Running setup.py"
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
