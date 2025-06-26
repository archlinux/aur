# Maintainer: Lukas Pöschl <lukas at smart-ies dot de>

_origname="cuckoo"
pkgname="${_origname}-chrome"
pkgver=1.5
pkgrel=2
pkgdesc="A tool to make managing linux installations on chromebooks easier."
arch=(x86_64)
url="https://github.com/pl-luk/cuckoo"
license=('GPL3')
depends=(python3 python-configobj python-cryptography openssl vboot-utils)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

backup=("etc/cuckoo.ini")

sha256sums=('dcb46c49de3ac3fa028c7346110c13002a3f1ef113b838b534022f9c2ee173c6')

package() {
	cd ${srcdir}/${_origname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
