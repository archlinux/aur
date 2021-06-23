# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=fadein
pkgver=4.0.7
pkgrel=1
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk2')
source=("$pkgname-$pkgver.tar.gz::http://www.fadeinpro.com/download/demo/fadein-linux-amd64-demo.tar.gz")
sha512sums=('3444678b77b979ccfc6af15190a3ee23b8caf0fdbf504b8442feea95015e7ac6077904ecfd663e8990095ce7d3f522464479748cefe919ed8af19aa44ac05116')

_vendor_name="fadein-linux-amd64"


package() {
	cd "$_vendor_name-$pkgver"

    install -d ${pkgdir}/usr/share/
    cp -R usr/share/fadein ${pkgdir}/usr/share/

    install -Dm644 usr/share/applications/fadein.desktop ${pkgdir}/usr/share/applications/fadein.desktop

    install -d ${pkgdir}/usr/bin/
    ln -s /usr/share/fadein/fadein ${pkgdir}/usr/bin/fadein
}
