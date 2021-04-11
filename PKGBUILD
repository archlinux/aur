# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="goshimmer-bin"
_pkgname="goshimmer"
pkgver="0.5.6"
pkgrel="3"
pkgdesc="GoShimmer implementation of Coordicide (official precompiled binary)"
arch=('x86_64')
url="https://github.com/iotaledger/goshimmer"
license=("Apache")
source=("https://github.com/iotaledger/goshimmer/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.tar.gz"
		"${_pkgname}.service")
sha256sums=('e8a2556ae6e119567a0eb5d8bee4c26e9c8a8cbc576d9db64572d532db41b71d'
            '37e021ce73e05f1878896de42c76877a68fe6a678294bda0de3934b1f5a0d9c8')
backup=('etc/goshimmer/config.json')
install=goshimmer.install

package() {

	# Make directorys
	mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/var/lib/goshimmer/ ${pkgdir}/etc/goshimmer/ ${pkgdir}/usr/lib/systemd/system/
	
	# Move files
	mv ${srcdir}/goshimmer ${pkgdir}/usr/bin/	
	mv ${srcdir}/config.json ${pkgdir}/etc/goshimmer/
	mv ${srcdir}/snapshot.bin ${pkgdir}/var/lib/goshimmer/
	mv ${srcdir}/README.md ${pkgdir}/var/lib/goshimmer/
	mv ${srcdir}/LICENSE ${pkgdir}/var/lib/goshimmer/
	
	# Install systemd service
	mv ${srcdir}/goshimmer.service ${pkgdir}/usr/lib/systemd/system/
}
