# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl
pkgver=1.1.1
pkgrel=1
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('x86_64')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl-git')
install="$pkgname.install"
source=("https://github.com/Hetsh/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4e1ef9a8f26ee8f367b49d59aee3fac44913e907f178c6078ac21412d54d3f24')

package() {
	install -Dm 644 "$srcdir/$pkgname-$pkgver/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/$pkgname-$pkgver/mcsctl" "$pkgdir/usr/bin/mcsctl"
}