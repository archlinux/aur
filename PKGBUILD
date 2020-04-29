# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-dodgy
pkgver=0.2.1
pkgrel=1
pkgdesc="Looks at Python code to search for things which look dodgy such as passwords or diffs"
arch=('any')
url="https://github.com/landscapeio/dodgy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'git')
source=(git+https://github.com/landscapeio/dodgy#tag=${pkgver})
sha256sums=('SKIP')

build() {
  cd "dodgy"

  python setup.py build
}

package() {
  cd "dodgy"

  python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
  install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
