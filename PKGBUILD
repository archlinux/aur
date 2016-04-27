#Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
#Former contributor: Matt Monaco <net 0x01b dgbaley27>
#Former maintainer: Gui||aume <michaudg at gmail.com>

pkgname=ceph-deploy
pkgver=1.5.33
pkgrel=1
arch=(any)
pkgdesc="Deploy Ceph with minimal infrastructure, using just SSH access"
url=http://ceph.com
license=(custom)
source=(${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/ceph/${pkgname}/tar.gz/v${pkgver})
sha256sums=('6a955f820684c45cf1628616e6287fdbe81c7abda8da5ad2a587800c5827ea7f')
depends=(python2 python2-pushy)
makedepends=(git python2-setuptools)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
