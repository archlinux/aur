# Maintainer: lisuke <1657787678@qq.com>
pkgname=xx-net
pkgver=3.6.3
pkgrel=1

pkgdesc="XX-Net, a web proxy tool."
arch=('i686' 'x86_64')
url="https://github.com/XX-net/XX-Net"
license=('unknown')
depends=('python2' 'supervisor')
options=('!strip')

optdepends=(
	'python: A high-level scripting language'
	'supervisor: A system for controlling process state under UNIX'
		)
makedepends=()
checkdepends=()

install=$pkgname.install


source=(
	"https://github.com/XX-net/$pkgname/archive/$pkgver.tar.gz"
	"XX-net.ini"
		)
noextract=()
md5sums=(
	'8e09c8b247aa16204d8914b11e90f0e5'
	'd439251c0022e4537231bbde87d36bac'
		)
validpgpkeys=()


package() {
	echo $pkgdir

	mkdir -p $pkgdir/opt/XX-net/
	cp -r ${srcdir}/XX-Net-$pkgver/* $pkgdir/opt/XX-net/

	mkdir -p $pkgdir/usr/bin/
	ln -s /opt/XX-net/xx_net.sh $pkgdir/usr/bin/xx_net

	mkdir -p $pkgdir/etc/supervisor.d/
	cp ${srcdir}/XX-net.ini $pkgdir/etc/supervisor.d/

	mkdir -p /var/log/supervisor/
}
