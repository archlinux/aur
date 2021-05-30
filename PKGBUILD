# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="goshimmer-bin"
_pkgname="goshimmer"
pkgver="0.6.4"
pkgrel="1"
pkgdesc="GoShimmer implementation of Coordicide (official precompiled binary)"
arch=('x86_64')
url="https://github.com/iotaledger/goshimmer"
license=("Apache")
source=("https://github.com/iotaledger/goshimmer/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.tar.gz"
		"${_pkgname}.service")
sha256sums=('b976a50acabaf6a9e323356c5f329bedb728c8361bab48c8c5815404ecb927cc'
            '37e021ce73e05f1878896de42c76877a68fe6a678294bda0de3934b1f5a0d9c8')
backup=('etc/goshimmer/config.json')
install=${_pkgname}.install

package() {

	# Install files
	install -Dm600 ${srcdir}/config.json ${pkgdir}/etc/goshimmer/config.json
	install -D ${srcdir}/goshimmer ${pkgdir}/usr/bin/goshimmer
	install -D ${srcdir}/snapshot.bin ${pkgdir}/var/lib/goshimmer/snapshot.bin
	install -D ${srcdir}/README.md ${pkgdir}/var/lib/goshimmer/README.md
	install -D ${srcdir}/LICENSE ${pkgdir}/var/lib/goshimmer/LICENSE
	
	# Install systemd service
	install -D ${srcdir}/goshimmer.service ${pkgdir}/usr/lib/systemd/system/goshimmer.service
}
