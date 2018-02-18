# Maintainer: Emanuele Faranda <black.silver@hotmail.it>
pkgname=arpreply-git
pkgver=r2.10e96ec
pkgrel=1
pkgdesc="arpreply - A tool to respond to ARP requests"
arch=('any')
url="https://github.com/emanuele-f/arpreply"
license=('GPLv3')
groups=()
depends=('python2' 'scapy')
makedepends=('git')
source=('git+https://github.com/emanuele-f/arpreply.git')
md5sums=('SKIP')
conflicts=()

pkgver() {
  cd "arpreply"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/arpreply"

  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 arpreply.py "${pkgdir}/usr/bin/arpreply"
}
