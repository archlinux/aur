pkgname=playwright-webkit-flite-deps
pkgver=2.2
pkgrel=1
pkgdesc="Missing flite dependencies needed for Playwright WebKit on Arch Linux"
arch=('x86_64')
url="https://playwright.dev"
license=('BSD')
depends=('flite' 'dpkg')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/f/flite/libflite1_2.2-7build1_amd64.deb")
sha256sums=('SKIP')

package() {
    dpkg-deb -x "${srcdir}/libflite1_2.2-7build1_amd64.deb" "${srcdir}/flite-extract"
    install -dm755 "${pkgdir}/usr/lib"
    cp "${srcdir}/flite-extract/usr/lib/x86_64-linux-gnu/libflite_cmu_grapheme"* "${pkgdir}/usr/lib/"
}
