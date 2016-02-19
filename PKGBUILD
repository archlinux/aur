# Maintainer: Lars Hagström <lars@teg>
pkgname=airtame-cli-git
pkgver=r45.7411cb2
pkgrel=1
pkgdesc="The AIRTAME Command Line interface"
arch=('i686' 'x86_64')
url="http://www.airtame.com"
license=('GPLv3')
groups=()
depends=("airtame-streamer" "python-pyzmq")
makedepends=()
backup=()
options=()
install=
source=("$pkgname"::"git+https://github.com/DonOregano/airtame-cli.git")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}
