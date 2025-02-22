# Maintainer: Emmanuel Farhi <emmanuel.farhi.1@gmail.com>
# create Arch package with: makepkg -si
# create .SRCINFO with:     makepkg --printsrcinfo > .SRCINFO
pkgname='confget'
pkgver=5.1.2
pkgrel=1
pkgdesc="Read variables from INI-style configuration files"
arch=(x86_64 i686 aarch64)
url="https://gitlab.com/confget/$pkgname"
license=('BSD-2-Clause')
depends=()
makedepends=('make')

source=("git+https://gitlab.com/confget/$pkgname")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make
	echo "[OK] Built $pkgname"
}

package() {
	install -Dm644 "${srcdir}/$pkgname/$pkgname.1" "${pkgdir}/usr/share/man/man1/$pkgname.1"
	install -Dm755 "${srcdir}/$pkgname/$pkgname"   "${pkgdir}/usr/bin/$pkgname"
	echo "[OK] Installed $pkgname"
}


