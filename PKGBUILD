# Maintainer: setBoolean <setboolean@icloud.com>
pkgname="goshimmer-bin"
_pkgname="goshimmer"
pkgver="0.5.4"
pkgrel="1"
pkgdesc="GoShimmer implementation of Coordicide (official precompiled binary)"
arch=('x86_64')
url="https://github.com/iotaledger/goshimmer"
license=("Apache")
source=("https://github.com/iotaledger/goshimmer/releases/download/v${pkgver}/${_pkgname}-${pkgver}_Linux_x86_64.tar.gz"
		"goshimmer.service")
sha256sums=('4106bb37f268f49009c6231a0423d60d8c130bb2ea9e95ca532279fdecb9a32b'
            'fa8f7409fe68d58e29640e915eae3aeb3b6585fdbee4bc550d3e0c105f18dc34')
backup=('var/lib/goshimmer/config.json')
install=goshimmer.install

package() {
	cd "${srcdir}"

	# Package files
	mkdir -p "${pkgdir}/usr/bin/"
	cp goshimmer "${pkgdir}/usr/bin/"
	
	mkdir -p "${pkgdir}/var/lib/goshimmer/"
	cp snapshot.bin "${pkgdir}/var/lib/goshimmer/"
	cp config.json "${pkgdir}/var/lib/goshimmer/"
	cp README.md "${pkgdir}/var/lib/goshimmer/"
	cp LICENSE "${pkgdir}/var/lib/goshimmer/"
	
	# Systemd service
	mkdir -p "${pkgdir}/usr/lib/systemd/system/"
	cp goshimmer.service "${pkgdir}/usr/lib/systemd/system/"
}
