#Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
#Former contributor: Matt Monaco <net 0x01b dgbaley27>
#Former maintainer: Gui||aume <michaudg at gmail.com>

pkgname=ceph-deploy
pkgver=1.5.31
pkgrel=2
arch=(any)
pkgdesc="Deploy Ceph with minimal infrastructure, using just SSH access"
url=http://ceph.com
license=(custom)
source=(${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/ceph/${pkgname}/tar.gz/v${pkgver})
sha256sums=("3fa7ac18ccc80830c1a6544a87dcda18804ec51de83cabc2c097dadcaca7ad7a")
depends=(python2 python2-pushy)
makedepends=(git python2-setuptools)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
