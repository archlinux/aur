# Contributor: lightning1141 <lightning1141@gmail.com>
pkgname=pocsuite-git
pkgdesc="Pocsuite is A remote vulnerability test framework developed by Knownsec Security Team. http://sebug.net"
pkgver=1.9.11.1.gb26a773
pkgrel=1
arch=('any')
url="https://github.com/knownsec/pocsuite3"
license=('GPL2')
depends=('python')
provides=('pocsuite')
conflicts=('pocsuite')
makedepends=('git')
options=('!strip')
source=("git+https://github.com/knownsec/pocsuite3.git")
md5sums=(SKIP)

_repo_name=pocsuite3

build() {
  cd "$srcdir/$_repo_name"
  python setup.py build
}

package() {
  cd "$srcdir/$_repo_name"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

pkgver() {
  cd "$srcdir/$_repo_name"
  git describe --tag --long --always | tr '-' '.' | sed 's/^v//'
}
