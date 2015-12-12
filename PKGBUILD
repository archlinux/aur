#Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
#Former contributor: Matt Monaco <net 0x01b dgbaley27>
#Former maintainer: Gui||aume <michaudg at gmail.com>

pkgname=ceph-deploy
pkgver=1.5.30
pkgrel=1
arch=(any)
pkgdesc="Deploy Ceph with minimal infrastructure, using just SSH access"
url=http://ceph.com
license=(custom)
source=(git://github.com/ceph/ceph-deploy.git#tag=v$pkgver)
sha256sums=(SKIP)
depends=(python2 python2-pushy)
makedepends=(git python2-setuptools)

package() {
	cd "$srcdir/$pkgname"
	python2 setup.py install --root="$pkgdir/" --optimize=1
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
