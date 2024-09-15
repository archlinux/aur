# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=tailwindcss-bin
pkgver=3.4.11
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=(x86_64)
url='https://tailwindcss.com'
license=('MIT')
options=(!strip)
conflicts=('tailwindcss')
provides=('tailwindcss')
source=("tailwindcss-linux-x64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")
sha256sums=('69504a1010013d0c7942aac8c69047fb1448a2d33c6cea1af6dfe274775b43df')

package() {
    install -d "${pkgdir}/usr/bin"

    mv "${srcdir}/tailwindcss-linux-x64" "${srcdir}/tailwindcss"
    
    install -m 755 tailwindcss "${pkgdir}/usr/bin/"

    chmod +x "${pkgdir}/usr/bin/tailwindcss"
}
