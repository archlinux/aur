# Maintainer: vimsucks <dev@vimsucks.com>
# Thanks to unstartdev https://aur.archlinux.org/packages/brook-systemd/
pkgname=brook-systemd-client
pkgver=v20181212
pkgrel=1
epoch=
pkgdesc="Install brook(client) with client systemd"
arch=('x86_64')
url="https://github.com/txthinking/brook"
license=('GPL')
groups=()
depends=('systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/txthinking/brook/releases/download/${pkgver}/brook"
	brook-client.service
	client-config.sh
	)
noextract=('brook' 'brook-client.service', 'client-config.sh')
md5sums=('c728ec28d2c41f585de0df26ea79c669'
         '65e83334eccd0e702ce54d3f08c738e3'
         '6e64f843a57d009d5d888ee970208153')
backup=(etc/brook/client-config.sh)
validpgpkeys=()

package() {
	mkdir -p $pkgdir/etc/brook
	install -Dm644 client-config.sh $pkgdir/etc/brook/client-config.sh
	install -D brook $pkgdir/usr/bin/brook
	install -Dm644 brook-client.service $pkgdir/usr/lib/systemd/system/brook-client.service
}
