# Maintainer: BlucherSKK <blucher1937@proton.me>
pkgname=nymphalis-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="It makes it easy to download media, manga, and other content from Patreon, desu.uno, gelboru, and so on"
arch=('x86_64')
url="https://github.com/BlucherSKK/nymphalis"
license=('MIT')
depends=('sqlite')
provides=('nymphalis')
conflicts=('nymphalis')
source_x86_64=("nymphalis-${pkgver}::https://github.com/BlucherSKK/nymphalis/releases/download/${pkgver}/nymphalis-linux-amd64")
sha256sums_x86_64=('SKIP')

package() {
    install -Dm755 "${srcdir}/nymphalis-${pkgver}" "${pkgdir}/usr/bin/nymphalis"

    # автодополнения
    DESTDIR="${pkgdir}" "${pkgdir}/usr/bin/nymphalis" add-shell-completions
}
