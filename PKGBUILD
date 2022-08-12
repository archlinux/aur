# Contributor: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=cppman-git
_pkgname=cppman
pkgver=20220122
pkgrel=1
pkgdesc="C++ 98/11/14 manual pages for Linux/MacOS"
arch=("any")
url="https://github.com/aitjcize/cppman"
license=("GPL")
depends=(python python-beautifulsoup4 python-html5lib)
optdepends=("vim: For using vim as a pager")
makedepends=(git)
provides=(cppman)
conflicts=(cppman)
source=("git+https://github.com/aitjcize/${_pkgname}")
sha256sums=("SKIP")


pkgver() {
  cd ${_pkgname}
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
  cd ${_pkgname}
  python setup.py build
}

package() {
  cd ${_pkgname}
  python setup.py install --root=${pkgdir}/ --optimize=1
}
