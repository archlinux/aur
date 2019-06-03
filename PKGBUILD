# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=fadein
pkgver=3.0.618
pkgrel=2
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk2')
source=("http://www.fadeinpro.com/download/demo/fadein-linux-amd64-demo.tar.gz")
md5sums=('d5121a093b4dfa3e46b1b3e7cb1dc08e')

_vendor_name="fadein-linux-amd64"


package() {
	cd "$_vendor_name-$pkgver"

    install -d ${pkgdir}/usr/share/
    cp -R usr/share/fadein ${pkgdir}/usr/share/

    install -Dm644 usr/share/applications/fadein.desktop ${pkgdir}/usr/share/applications/fadein.desktop

    install -d ${pkgdir}/usr/bin/
    ln -s /usr/share/fadein/fadein ${pkgdir}/usr/bin/fadein
}
