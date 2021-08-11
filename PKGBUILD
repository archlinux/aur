# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>

_pkgbase=v4l2loopback
pkgname=v4l2loopback-utils
pkgver=0.12.5
pkgrel=2
pkgdesc="v4l2-loopback device (utilities only)"
arch=(any)
url="https://github.com/umlaeute/v4l2loopback"
license=(GPL)
depends=(V4L2LOOPBACK-MODULE)
conflicts=(v4l2loopback-dkms v4l2loopback-dkms-git)
replaces=(v4l2loopback-dkms v4l2loopback-dkms-git)
makedepends=(help2man)
source=(https://github.com/umlaeute/v4l2loopback/archive/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz)
sha256sums=('e152cd6df6a8add172fb74aca3a9188264823efa5a2317fe960d45880b9406ae')

package() {
	cd ${_pkgbase}-${pkgver}

	make DESTDIR="${pkgdir}" PREFIX="/usr" install-utils install-man
}
