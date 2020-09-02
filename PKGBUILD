 # Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=python-omgifol-git
pkgver=r69.9dcabda
pkgrel=1
pkgdesc="A Python library for manipulating Doom WAD files"

url='https://github.com/devinacker/omgifol'
arch=('any')
license=('MIT')
depends=('python')
provides=('python-omgifol')
conflicts=('python-omgifol')
makedepends=('python-setuptools' 'git')

source=("git+https://github.com/devinacker/omgifol.git")

sha256sums=('SKIP')

pkgver() {
  cd omgifol
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/omgifol"
  python ./setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
