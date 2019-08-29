# Maintainer: Alessandro Pazzaglia <alessandro.pazzaglia@sadel.it>

pkgname=scuba-git
pkgver=v2.3.0.r46.0244c81
pkgrel=1
pkgdesc="SCUBA is a simple tool that makes it easier to use Docker containers in everyday development"
arch=('any')
url="https://github.com/JonathonReinhart/scuba"
license=('MIT')
makedepends=('git')
depends=('python-yaml')
source=('scuba-git::git+https://github.com/JonathonReinhart/scuba.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-VCS}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
