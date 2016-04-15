#Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
#Former contributor: Matt Monaco <net 0x01b dgbaley27>
#Former maintainer: Gui||aume <michaudg at gmail.com>

pkgname=ceph-deploy
pkgver=1.5.32
pkgrel=1
arch=(any)
pkgdesc="Deploy Ceph with minimal infrastructure, using just SSH access"
url=http://ceph.com
license=(custom)
source=(${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/ceph/${pkgname}/tar.gz/v${pkgver})
sha256sums=('1d9aa018eb5d8eb8d8c0137863cc1685d1d8e0955f2fb81a65f75f1a549de503')
depends=(python2 python2-pushy)
makedepends=(git python2-setuptools)

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}/" --optimize=1
	install -m644 -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
