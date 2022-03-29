# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=fadein
pkgver=4.0.13
pkgrel=1
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk2')
source=("$pkgname-$pkgver.tar.gz::http://www.fadeinpro.com/download/demo/fadein-linux-amd64-demo.tar.gz")
sha512sums=('c8fee0d2a6a4d074ce33a3b90cf3f3315152deb08034105101c61d2696859206faa7e9ccb793dcd4f8e2d1ce482dbe382189167e77a74739bdd75e13dd216a8f')

_vendor_name="fadein-linux-amd64"


package() {
	cd "$_vendor_name-$pkgver"

    install -d ${pkgdir}/usr/share/
    cp -R usr/share/fadein ${pkgdir}/usr/share/

    install -Dm644 usr/share/applications/fadein.desktop ${pkgdir}/usr/share/applications/fadein.desktop

    install -d ${pkgdir}/usr/bin/
    ln -s /usr/share/fadein/fadein ${pkgdir}/usr/bin/fadein
}
