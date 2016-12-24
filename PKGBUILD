#Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
#Former contributor: Matt Monaco <net 0x01b dgbaley27>
#Former maintainer: Gui||aume <michaudg at gmail.com>

pkgname=ceph-deploy
pkgver=1.5.36
pkgrel=1
arch=(any)
pkgdesc="Deploy Ceph with minimal infrastructure, using just SSH access"
url=http://ceph.com
license=(custom)
source=(${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/ceph/${pkgname}/tar.gz/v${pkgver})
sha512sums=('8796048ccded6541fd3146c83ae26625e37a097d91a9a93bd5440df938debac7107269b6810f089d8a4184a7492a47db044602079e84170caec5a141738afab8')
depends=(python2)
makedepends=(git python2-setuptools)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python2 setup.py install --root="${pkgdir}/" --optimize=1
	install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

