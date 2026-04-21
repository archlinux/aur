# Maintainer: Dawid Majewski <mdawid581 at gmail dot com>
pkgname=lcemp-server
pkgver=1.0.1
pkgrel=1
install=$pkgname.install
pkgdesc="Dedicated Minecraft Legacy Edition server"
arch=('x86_64')
url="https://github.com/LCEMP/LCEMP-Server"
license=('Other')
source=("https://github.com/LCEMP/LCEMP-Server/releases/download/1.0.1/MinecraftDedicatedServer-Linux"
		"$pkgname.service"
		)
sha256sums=('SKIP' 'SKIP')
depends=('screen')

package() {
	install -Dm755 $srcdir/MinecraftDedicatedServer-Linux "$pkgdir/srv/lcemp/MinecraftDedicatedServer-Linux"
	install -Dm444 "$srcdir/$pkgname.service" "$pkgdir/etc/systemd/system/$pkgname.service"
}