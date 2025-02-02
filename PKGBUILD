# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=tailwindcss-bin
pkgver=4.0.3
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=(x86_64)
url='https://tailwindcss.com'
license=('MIT')
options=(!strip)
conflicts=('tailwindcss')
provides=('tailwindcss')
source=("tailwindcss-linux-x64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")
sha256sums=('5d410163e86627c6c0268004e49a598b2880c531466dd1b3cf9b469793d3862d')

package() {
    install -d "${pkgdir}/usr/bin"

    mv "${srcdir}/tailwindcss-linux-x64" "${srcdir}/tailwindcss"
    
    install -m 755 tailwindcss "${pkgdir}/usr/bin/"

    chmod +x "${pkgdir}/usr/bin/tailwindcss"
}
