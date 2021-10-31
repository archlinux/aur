# Maintainer: Thomas Weißschuhu <aur t-8ch de>

pkgname=gem2deb
pkgver=1.6
_defaults_version="2.7.6"
pkgrel=1
pkgdesc='Debian Ruby packaging suite'
arch=('any')
url='http://packages.debian.org/sid/gem2deb'
license=('GPL3')
depends=('ruby')
source=(
	"http://http.debian.net/debian/pool/main/g/gem2deb/gem2deb_${pkgver}.tar.xz"
	"https://salsa.debian.org/ruby-team/ruby-defaults/-/archive/debian/1%25${_defaults_version}/ruby-defaults-debian-1%25${_defaults_version}.tar.gz"
)

package() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/ruby/vendor_ruby/"
	cp bin/* "$pkgdir/usr/bin"
	cp -R lib/* "$pkgdir/usr/lib/ruby/vendor_ruby/"

	install \
		"$srcdir/ruby-defaults-debian-1%${_defaults_version}/ruby_debian_dev.rb" \
		"$pkgdir/usr/lib/ruby/vendor_ruby/"
}

sha256sums=('0ba3e86ab3092e6872983525565d63b8868eae74abfb1372519b738ea9e687a1'
            '34a3a8b8fc854280be002443ed0a881a015c6aef90d8d4cfba7829da1a470b73')
