# Maintainer: Matthew "Madness" Evan <mattmadness@420blaze.it>
pkgname=notflix-git
pkgver=1.02.r0.d6e51e21
pkgrel=0
pkgdesc="Bugswriter's tool which search magnet links and streams one with peerflix."
arch=(any)
license=('GPL3')
url='https://github.com/Bugswriter/notflix'
depends=('bash' 'grep' 'coreutils' 'curl' 'sed' 'peerflix')
source=("git+https://github.com/Bugswriter/notflix.git")
sha256sums=("SKIP")

package() {
	cd "$srcdir/notflix"
    git pull origin d6e51e217f8b2e7cc967397304b212d69ebcd874 
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
    mkdir -p ${pkgdir}/usr/share/doc/${pkgname}/
    cp preview.gif ${pkgdir}/usr/share/doc/${pkgname}/
    cp README.md ${pkgdir}/usr/share/doc/${pkgname}/
	mkdir -p ${pkgdir}/usr/bin/
	cp notflix ${pkgdir}/usr/bin/notflix
    chmod +x ${pkgdir}/usr/bin/notflix
}	
