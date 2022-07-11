# Maintainer: ftsell <aur@finn-thorben.me>
pkgname=python-catkin-tools-git
pkgver=r820.69964db
pkgrel=1
_gitname=catkin_tools
_gitbranch=main
pkgdesc="Command line tools for working with catkin"
arch=(any)
url="https://github.com/catkin/catkin_tools"
license=("Apache")
makedepends=("git")
depends=("python" "python-catkin_pkg" "python-yaml" "python-setuptools" "python-osrf_pycommon")
conflicts=("python-catkin-tools")
source=("${_gitname}::git+https://github.com/catkin/${_gitname}.git#branch=${_gitbranch}")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}



