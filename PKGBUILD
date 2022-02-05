# Maintainer: Kai Muenz <kai+archlinux@muenz.net>
_pkgname=odr-radioepg-bridge
pkgname=$_pkgname-git
pkgver=0.1.r35.6e8d578
pkgrel=1
pkgdesc="Opendigitalradio tool for creating DAB EPG bitstream from ODR multiplex, using RadioDNS"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Opendigitalradio/$_pkgname"
license=('GPL')
groups=('ODR')
depends=('python-hybridspi' 'odr-radiodns-bridge' 'python-mot' 'python-mot-epg' 'python-msc' 'python-isodate' 'python-bitarray' 'python-crcmod')
checkdepends=()
optdepends=()
provides=("$_pkgname" "$pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir"/"$_pkgname"
	install -Dm644 generate-epg -t "${pkgdir}/usr/bin/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
