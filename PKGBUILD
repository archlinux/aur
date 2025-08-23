# Maintainers: let <let@notlet.dev>, EnumDev <enumdev@enumerated.dev>

pkgname=stormfetch
pkgver=6.2
pkgrel=1
pkgdesc='A simple linux fetch program written in go and bash'
arch=('any')
url='https://github.com/EnumeratedDev/stormfetch'
license=('MIT')

makedepends=('libx11' 'go' 'make')
depends=('bash' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd')

source=("git+https://github.com/EnumeratedDev/stormfetch.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
	cd "$srcdir/stormfetch"
	make PREFIX=/usr SYSCONFDIR=/etc
}

package() {
	cd "$srcdir/stormfetch"
	make DESTDIR="$pkgdir" PREFIX=/usr SYSCONFDIR=/etc install
	
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
