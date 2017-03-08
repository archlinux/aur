_pkgname=labots
pkgname=${_pkgname}-git
pkgver=0.50.fc7d0c0
pkgrel=1
pkgdesc='Flexible IRC bot framework'
arch=('any')
url="https://github.com/SilverRainZ/${_pkgname}"
license=('GPL3')
makedepends=('git')
depends=('python' 'python-tornado' 'python-pyinotify' 'python-yaml' )
conflicts=('labots')
provides=('labots')
source=("git+https://github.com/SilverRainZ/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "${srcdir}/${_pkgname}"

  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}"

  python3 setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
