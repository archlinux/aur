# Maintainer: vimsucks <dev@vimsucks.com>
# Thanks to unstartdev https://aur.archlinux.org/packages/brook-systemd/
pkgname=brook-systemd-client
pkgver=v20190205
pkgrel=1
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
md5sums_x86_64=('c0999724f679120c029a5c55d8db240f')
md5sums_i686=('56df060f40a1775e03fbd59f7c3d38bb')
md5sums_arm=('2f78ca0448402da780cc8364aa74c931')
md5sums_armv6h=('44ab2eb253199afe8100e63ec3c61a7e')
md5sums_armv7h=('8ce9f09074134c5f34372011392c3875')
md5sums_aarch64=('42c30651462c9d57cdebf719047f57ad')
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
