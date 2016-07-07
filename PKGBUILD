# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=krill-git
pkgver=v0.3.0.r1.ga1031ea
pkgrel=1
pkgdesc="Read and filter web feeds."
arch=('any')
url="https://github.com/p-e-w/krill"
license=('GPL3')
depends=('python-beautifulsoup4' 'python-blessings' 'python-feedparser' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=('krill')
conflicts=('krill')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd krill
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd krill
  python setup.py build
}

package() {
  cd krill
  python setup.py install --root="$pkgdir/" --optimize=1
}
