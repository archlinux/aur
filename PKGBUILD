# Maintainer Stefano Lovato <stefano.lovato.1@phd.unipd.it>
pkgname=sbbhost
pkgver=0.1.r1.92322ac
pkgrel=1
pkgdesc="Application for host communication with the self-balancing-bike microcontroller."
arch=('any')
url="https://github.com/stefphd/SBBHost"
license=('MIT')
depends=('gtkmm-4.0' 'fftw')
makedepends=('git')
source=("git+https://github.com/stefphd/SBBHost.git")
md5sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd SBBHost
	./configure --prefix /usr
	make build
}

package() {
	cd SBBHost
	make installer INSTALLER=$pkgdir
}
