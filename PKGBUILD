# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=fadein
pkgver=2.0.542
pkgrel=2
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('libpng12')
source=("http://www.fadeinpro.com/download/demo/fadein-linux-amd64-demo.tar.gz")
md5sums=('4fbcea9f5ab0db17404766002d04b995')

_vendor_name="fadein-linux-amd64"


package() {
	cd "$_vendor_name-$pkgver"

    install -d ${pkgdir}/usr/share/
    cp -R usr/share/fadein ${pkgdir}/usr/share/

    install -Dm644 usr/share/applications/fadein.desktop ${pkgdir}/usr/share/applications/fadein.desktop

    install -d ${pkgdir}/usr/bin/
    ln -s /usr/share/fadein/fadein ${pkgdir}/usr/bin/fadein
}
