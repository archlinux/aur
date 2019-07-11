#Maintainer: Ricardo Band <email@ricardo.band>
#Former Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
#Former contributor: Matt Monaco <net 0x01b dgbaley27>
#Former maintainer: Gui||aume <michaudg at gmail.com>

pkgname=ceph-deploy
pkgver=2.0.1
pkgrel=1
arch=(any)
pkgdesc="Deploy Ceph with minimal infrastructure, using just SSH access"
url=http://ceph.com
license=(MIT)
source=("https://github.com/ceph/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f8309b26afb222a325cec0a31779d91e58aa8b8b5ed6d3d891370eb076d696c0')
depends=(python python-remoto)
makedepends=(python-setuptools)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	python setup.py install --root="${pkgdir}/" --optimize=1
	install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

