# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('1ed2ec43bc174220dc4fecb2dc94d17eefbe1c7e')
pkgrel=1
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit file.'
arch=('x86_64')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('systemd' 'screen' 'jre-openjdk-headless')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
source=("$url/archive/$commit.tar.gz")
sha256sums=('25dbeca8bed3ab2e91c2bb3f792ab4f41fd58fd3037461bd02f89def4ad51557')

package() {
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
}