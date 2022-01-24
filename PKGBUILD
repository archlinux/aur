# Maintainer: George Angelopoulos <george@usermod.net>
pkgname=fadein
pkgver=4.0.11
pkgrel=1
pkgdesc="Professional screenwriting software (DEMO)"
arch=('x86_64')
url="http://www.fadeinpro.com/"
# No license file is provided.
license=('custom')
depends=('gtk2')
source=("$pkgname-$pkgver.tar.gz::http://www.fadeinpro.com/download/demo/fadein-linux-amd64-demo.tar.gz")
sha512sums=('b0881a9132c1aa0aa55ae93f97a757896e3de899729377a8e8edcf4b031f54c845f349e33d6f0818132c1a09bf7ec2f02693c6e6ff6b8588cf1109ade62a597b')

_vendor_name="fadein-linux-amd64"


package() {
	cd "$_vendor_name-$pkgver"

    install -d ${pkgdir}/usr/share/
    cp -R usr/share/fadein ${pkgdir}/usr/share/

    install -Dm644 usr/share/applications/fadein.desktop ${pkgdir}/usr/share/applications/fadein.desktop

    install -d ${pkgdir}/usr/bin/
    ln -s /usr/share/fadein/fadein ${pkgdir}/usr/bin/fadein
}
