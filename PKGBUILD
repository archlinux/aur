#Maintainer: Ricardo Band <email@ricardo.band>
#Former Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
#Former contributor: Matt Monaco <net 0x01b dgbaley27>
#Former maintainer: Gui||aume <michaudg at gmail.com>

pkgname=ceph-deploy
pkgver=2.1.0
pkgrel=1
arch=(any)
pkgdesc="Deploy Ceph with minimal infrastructure, using just SSH access"
url=http://ceph.com
license=(MIT)
source=("https://github.com/ceph/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('15e60e3fe7bdb7b7b67787bd523744216d8941cc1616081870e099a7010969a4')
depends=(python python-remoto)
makedepends=(python-setuptools)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}/" --optimize=1
	install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

