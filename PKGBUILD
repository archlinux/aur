# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=python-pytox-git
_pkgname=PyTox
pkgver=20160204
pkgrel=1
pkgdesc="Python binding for Project-Tox the skype replacement"
arch=('i686' 'x86_64')
url="https://github.com/aitjcize/PyTox"
license=('GPL')
makedepends=(git)
depends=(python toxcore)
source=("git://github.com/aitjcize/${_pkgname}")
sha256sums=("SKIP")

pkgver() {
  cd $_pkgname
  git log -1 --pretty='%cd' --date=short | tr -d '-'
}

build() {
  cd $_pkgname
  python setup.py build
}

package() {
  cd $_pkgname
  python setup.py install --root=${pkgdir}/ --optimize=1
}
