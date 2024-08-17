# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=tailwindcss-bin
pkgver=3.4.10
pkgrel=1
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=(x86_64)
url='https://tailwindcss.com'
license=('MIT')
options=(!strip)
conflicts=('tailwindcss')
provides=('tailwindcss')
source=("tailwindcss-linux-x64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")
sha256sums=('0c3e21d8479a4c53ffe1cfc7fe965f6b60d8cf597bdf34db132b8c65c6143541')

package() {
    install -d "${pkgdir}/usr/bin"

    mv "${srcdir}/tailwindcss-linux-x64" "${srcdir}/tailwindcss"
    
    install -m 755 tailwindcss "${pkgdir}/usr/bin/"

    chmod +x "${pkgdir}/usr/bin/tailwindcss"
}
