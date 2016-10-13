# Maintainer: Doyle Fermi <doylefermi@gmail.com>
pkgname=dracnmap-git
pkgver=1
pkgrel=1
pkgdesc="Dracnmap is an open source program which is using to exploit the network and gathering information with nmap help."
arch=("any")
url="https://github.com/Screetsec/Dracnmap.git"
license=("MIT")
conflicts=("dracnmap")
depends=("nmap")
makedepends=("git")
source=("$pkgname::git+https://github.com/Screetsec/Dracnmap.git")
md5sums=('SKIP')

prepare() {
	cd "$pkgname"
	chmod +x "Dracnmap.sh"
}

package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	install -m755 Dracnmap.sh "$pkgdir/usr/bin/dracnmap"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
