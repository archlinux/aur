# Maintainer: Jean Pierre Cimalando <jp-dev@inbox.ru>
pkgname=setup-fast-track-ultra-git
pkgver=r7.657dc38
pkgrel=2
epoch=
pkgdesc="Automatic setup of M-Audio Fast Track Ultra for JACK on Linux"
arch=('any')
url="https://github.com/jpcima/fast-track-ultra"
license=('Boost')
groups=()
depends=('bash')
makedepends=('git' 'make' 'sed')
checkdepends=()
optdepends=()
provides=('setup-fast-track-ultra')
conflicts=('setup-fast-track-ultra')
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/jpcima/fast-track-ultra")
md5sums=('SKIP')
noextract=()
validpgpkeys=()

pkgver() {
  cd "fast-track-ultra"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "fast-track-ultra"
  make PREFIX=/usr SBINDIR=/usr/bin UDEVDIR=/usr/lib/udev DESTDIR="$pkgdir" install
}
