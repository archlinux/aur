# Maintainer: Dawid Majewski <mdawid581 at gmail dot com>
pkgname=mcc
pkgver=20260415-429
pkgrel=1
pkgdesc="Minecraft Console Client"
install=$pkgname.install
arch=('x86_64' 'aarch64')
url="https://github.com/MCCTeam/Minecraft-Console-Client"
license=('CDDL')
source=("https://mccteam.github.io/install.sh")
sha256sums=('SKIP')


build() {
	./install.sh
}

package() {
	install -Dm755 "$srcdir/MinecraftClient" "$pkgdir/etc/mcc/MinecraftClient"
	install -d "$pkgdir/etc/mcc"
	install -Dm755 "$srcdir/mcc" "$pkgdir/usr/bin/mcc"
}