# Maintainer: Raymo111 <aur@raymond.li>
# Contributor: Barry <brrtsm at gmail . com>
# Contributor: dmerej <d.merej@gmail.com>

pkgname=hollywood
pkgver=1.25
pkgrel=1

pkgdesc="Fill your console with Hollywood melodrama technobabble."

arch=('any')

url="https://github.com/dustinkirkland/hollywood"
license=('Apache' 'Custom:CC0-1.0')

depends=(
	'apg'
	'bmon'
	'byobu'
	'ccze'
	'cmatrix'
	'coreutils'
	'gawk'
	'htop'
	'jp2a'
	'mlocate'
	'man'
	'moreutils'
	'openssh'
	'tree'
	'speedometer'
	'util-linux'
)

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/dustinkirkland/${pkgname}/archive/refs/tags/${pkgver}.tar.gz"
	"license.txt"
)

sha256sums=('6eb1509ad1a19a2b475ecc09c4199017cc3fafbfb7fa990fe5ec408367f83962'
            'a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499')

package() {
	# Install files
	install -dm0755 "$pkgdir/"{usr/bin,usr/lib/hollywood,usr/share/{licenses/hollywood,man/man1,hollywood}}
	install -m 0755 "$srcdir/$pkgname-$pkgver/bin/hollywood"  "$pkgdir/usr/bin"
	install -m 0755 "$srcdir/$pkgname-$pkgver/lib/hollywood/"* "$pkgdir/usr/lib/hollywood"
	install -m 0644 "$srcdir/$pkgname-$pkgver/share/hollywood/"*  "$pkgdir/usr/share/hollywood"
	install -m 0644 "$srcdir/$pkgname-$pkgver/"{README.md,debian/changelog}  "$pkgdir/usr/share/hollywood"
	install -m 0644 "$srcdir/$pkgname-$pkgver/share/man/man1/"*  "$pkgdir/usr/share/man/man1"
	# License
	install -m 0644 "$srcdir/license.txt" "$pkgdir/usr/share/licenses/hollywood/license.txt"
}
