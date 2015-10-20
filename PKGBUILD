# Maintainer: Daniel Morawetz <d dot morawetz at tech-review dot de>
pkgname=netbench
pkgver=v1.0.0
pkgrel=1
pkgdesc="Easy-to-use network-speed testing"
arch=('any')
url="https://bitbucket.org/Morosko/netbench/downloads"
license=('GPL2')
groups=()
depends=('java-environment=8')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname.tar.gz::https://bitbucket.org/Morosko/netbench/downloads/netbench-v1.0.0.tar.gz")
noextract=()
md5sums=('90c312c4567e5c84785fedba8889ab3b')

package() {
	cd "${srcdir}"
	
	dd if=/dev/urandom of=$pkgname-$pkgver/test.txt bs=1M count=5
	
	install -d -m755 ${pkgdir}/usr/share/${pkgname}
	install -d -m755 $pkgdir/usr/share/$pkgname/bin
	install -d -m755 $pkgdir/usr/bin

	cp -a $pkgname-$pkgver/* ${pkgdir}/usr/share/${pkgname}/bin/
	
	chmod +x $pkgdir/usr/share/$pkgname/bin/netbench-client.sh
	chmod +x $pkgdir/usr/share/$pkgname/bin/netbench-server.sh

	ln -s $pkgdir/usr/share/$pkgname/bin/netbench-client.sh $pkgdir/usr/bin/netbench-client 
	ln -s $pkgdir/usr/share/$pkgname/bin/netbench-server.sh $pkgdir/usr/bin/netbench-server 
}
