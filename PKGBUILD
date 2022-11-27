# Maintainer: Matej Lach <me@matej-lach.me>

pkgname=tailwindcss-bin
pkgver=3.2.4
pkgrel=2
pkgdesc='Standalone Tailwind CLI without dependency on Node.js'
arch=(x86_64)
url='https://tailwindcss.com'
license=('MIT')
options=(!strip)
conflicts=('tailwindcss')
provides=('tailwindcss')
source=("tailwindcss-linux-x64::https://github.com/tailwindlabs/tailwindcss/releases/download/v${pkgver}/tailwindcss-linux-x64")
sha256sums=('cd52e757cb0bd15238f0207a215198d924811234028d056b7be39fde70491296')

package() {
    install -d "${pkgdir}/usr/bin"

    mv "${srcdir}/tailwindcss-linux-x64" "${srcdir}/tailwindcss"
    
    install -m 755 tailwindcss "${pkgdir}/usr/bin/"

    chmod +x "${pkgdir}/usr/bin/tailwindcss"
}
