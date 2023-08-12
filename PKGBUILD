pkgname=cosmographia-bin
pkgver=4.2
pkgrel=1
pkgdesc="Cosmographia is a visualization program rendering the solar system and its bodies in 3D to create a freely navigable map of the solar system"
arch=('x86_64')
url="https://naif.jpl.nasa.gov/naif/cosmographia.html"
license=('unknow')
provides=('cosmographia')
source=("https://naif.jpl.nasa.gov/pub/naif/cosmographia/packages/cosmo-installer-${pkgver}-linux")
sha256sums=('8025d5f14cfd70c94caf8b573eed19c6c5c1862b73a1220eee9e1fbcf224dd75')

package() {
	mkdir -p "${pkgdir}/usr/bin"
	chmod u+x cosmo-installer-${pkgver}-linux
	./cosmo-installer-${pkgver}-linux install -t "$pkgdir/opt/cosmographia"
	ln -s "/opt/cosmographia/Cosmographia.sh" "${pkgdir}/usr/bin/cosmographia"
}
