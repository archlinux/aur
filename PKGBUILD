
pkgname=pyinstaller-git
_pyname=pyinstaller
pkgver=r4623.cd5d9ac
pkgrel=1
pkgdesc="An application to convert python scripts into stand-alone binaries"
arch=('i686' 'x86_64')
url="http://www.pyinstaller.org"
license=('GPL2')
depends=('python')
provides=('pyinstaller')
conflicts=('pyinstaller')
source=("git+https://github.com/pyinstaller/pyinstaller.git")
md5sums=('SKIP')
options=('!strip' '!emptydirs')

pkgver() {
  cd "${srcdir}/${_pyname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pyname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pyname}"
  python setup.py install --root="${pkgdir}"
}
