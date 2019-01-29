# Maintainer: vimsucks <dev@vimsucks.com>
# Thanks to unstartdev https://aur.archlinux.org/packages/brook-systemd/
pkgname=brook-systemd-client
pkgver=v20181212
pkgrel=2
epoch=
pkgdesc="Install brook(client) with client systemd"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
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
source=(brook-client.service client-config.sh)
source_x86_64=("brook_linux_amd64::https://github.com/txthinking/brook/releases/download/${pkgver}/brook")
source_i686=("https://github.com/txthinking/brook/releases/download/${pkgver}/brook_linux_386")
source_arm=("https://github.com/txthinking/brook/releases/download/${pkgver}/brook_linux_arm5")
source_armv6h=("https://github.com/txthinking/brook/releases/download/${pkgver}/brook_linux_arm6")
source_armv7h=("https://github.com/txthinking/brook/releases/download/${pkgver}/brook_linux_arm7")
source_aarch64=("https://github.com/txthinking/brook/releases/download/${pkgver}/brook_linux_arm64")
noextract=('brook' 'brook-client.service', 'client-config.sh')
md5sums=('65e83334eccd0e702ce54d3f08c738e3'
         '6e64f843a57d009d5d888ee970208153')
md5sums_x86_64=('c728ec28d2c41f585de0df26ea79c669')
md5sums_i686=('020d61905aa1e71e334a35ee49c84d00')
md5sums_arm=('97abbf38fc4672c9b59d7b041f57d859')
md5sums_armv6h=('84ad403af8c09bf1f6ba497c9a7582de')
md5sums_armv7h=('3300e474d849071cb5ca11a17d114a28')
md5sums_aarch64=('f35f08c87b3d8a95c309aa3114a8753b')
backup=(etc/brook/client-config.sh)
validpgpkeys=()

package() {
	case $CARCH in
		x86_64)ARCH=amd64
			;;
		i686)ARCH=386
			;;
		arm)ARCH=arm5
			;;
		armv6h)ARCH=arm6
			;;
		armv7h)ARCH=arm7
			;;
		aarch64)ARCH=arm64
			;;
	esac
	mkdir -p $pkgdir/etc/brook
	install -Dm644 client-config.sh $pkgdir/etc/brook/client-config.sh
	install -D brook_linux_${ARCH} $pkgdir/usr/bin/brook
	install -Dm644 brook-client.service $pkgdir/usr/lib/systemd/system/brook-client.service
}
