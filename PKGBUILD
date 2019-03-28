# Maintainer: Jan Metzger <Jan-Metzger@hetsh.de>

pkgname=mcsctl
pkgver=1.1.0
pkgrel=1
pkgdesc="Helpers for basic minecraft server management."
arch=('x86_64')
url="https://github.com/Hetsh/mcsctl"
license=('GPL3')
depends=('systemd' 'screen' 'jre-openjdk-headless')
provides=('mcsctl')
conflicts=('mcsctl-git')
install=$pkgname.install
source=("https://github.com/Hetsh/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d1fbe2fad333bbc637f0e2298e96e5ddb1a794e53af62a578376ad94695ec768')

package() {
	install -Dm 644 "$srcdir/$pkgname-$pkgver/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/$pkgname-$pkgver/mcsctl" "$pkgdir/usr/bin/mcsctl"
}