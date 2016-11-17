# Maintainer: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=ananicy-git
pkgver=83.9dde5ef
pkgrel=1
pkgdesc="Ananicy - is Another auto nice daemon, with community rules support"
arch=('any')
url="https://github.com/Nefelim4ag/Ananicy.git"
license=('GPL3')
depends=('systemd' 'bash')
makedepends=('rsync' 'git')
source=("$pkgname"::'git://github.com/Nefelim4ag/Ananicy.git#branch=master')
md5sums=('SKIP')
install=$pkgname.install

pkgver() {
  cd ${pkgname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd "$srcdir/${pkgname}/"
  ./install.sh PREFIX="$pkgdir"
}
