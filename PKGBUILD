# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
pkgname=firetunnel-git
pkgver=r29.4861cd7
pkgrel=1
pkgdesc="Tunneling program for Firejail sandboxes"
arch=('any')
depends=('systemd' 'networkmanager')
url="https://github.com/netblue30/firetunnel"
license=('GPL')
makedepends=('git')
provide=('firetunnel')
source=("git://github.com/netblue30/firetunnel.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/firetunnel"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/firetunnel"
	./configure --prefix=/usr
	make
}

package() {
  cd "${srcdir}/firetunnel"
	make DESTDIR="${pkgdir}" install-strip
}
