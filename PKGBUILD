# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=fadein
pkgver=4.0.14
pkgrel=1
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk2')
source=("$pkgname-$pkgver.tar.gz::http://www.fadeinpro.com/download/demo/fadein-linux-amd64-demo.tar.gz")
sha512sums=('fb662ffadf5bb53cdf6fc742c1199070a737822db157fee8728f44e673f33309aa3b85896bbefd24684882c691bb6378bf3f5b01113af8b627a321ab513339bc')

_vendor_name="fadein-linux-amd64"


package() {
	cd "$_vendor_name-$pkgver"

    install -d ${pkgdir}/usr/share/
    cp -R usr/share/fadein ${pkgdir}/usr/share/

    install -Dm644 usr/share/applications/fadein.desktop ${pkgdir}/usr/share/applications/fadein.desktop

    install -d ${pkgdir}/usr/bin/
    ln -s /usr/share/fadein/fadein ${pkgdir}/usr/bin/fadein
}
