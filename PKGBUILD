# Maintainer: lisuke <1657787678@qq.com>
pkgname=xx-net
pkgver=5.9.0
pkgrel=6

pkgdesc="XX-Net, a web proxy tool."
arch=('any')
url="https://github.com/XX-net/XX-Net"
license=('unknown')
depends=('python' 'python-pycryptodome')
options=('!strip')

optdepends=()
makedepends=()
checkdepends=()

source=(
	"https://github.com/XX-net/$pkgname/archive/$pkgver.tar.gz"
	"xx-net.service"
		)
noextract=()
md5sums=('95c987136555cce4ad9fb186880e3047'
         'c0a4e9d6f4c8fcee0e8a26f3018dfe4f')
install=$pkgname.install
validpgpkeys=()

package() {
	mkdir -p $pkgdir/opt/XX-net/
	cp -r ${srcdir}/XX-Net-$pkgver/* $pkgdir/opt/XX-net/

	mkdir -p $pkgdir/usr/bin/
	ln -s /opt/XX-net/xx_net.sh $pkgdir/usr/bin/xx_net

	install -D -m644 ${srcdir}/xx-net.service $pkgdir/usr/lib/systemd/system/xx-net.service
}
