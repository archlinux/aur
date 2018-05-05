# Maintainer: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer :/dev/rs0 <rs0@secretco.de.com>

pkgname=springseed
pkgver=2.0
pkgrel=11
pkgdesc="Simply awesome note taking"

arch=('arm' 'i686' 'x86_64')
license=('MIT')
url="https://github.com/spsdco/notes"

depends=('electron')
source=(
    "https://github.com/spsdco/notes/archive/2.0.zip"
    "springseed" "springseed.svg" "springseed.desktop")
sha256sums=(
    'f9979a922fb298df3bead6b326b71249c08e3264458db61ad110367754bb7798'
    '97f524c4e6fc1170279015ccec9304c6e3b704b98a8907033af64119d3b2e115'
    'bad6f3233653fed2041fdad1bf8f67adc3f849b069c5f200239b435eed005c07'
    'd2a249a140075f887bf8841ebc58e89e5ceefaa98c355857a6a3a3bc108a4847')

package() {
    install -d "${pkgdir}/usr/share/springseed"
    cp -a "${srcdir}/notes-2.0/." "${pkgdir}/usr/share/springseed"
    find "${pkgdir}" -type d -exec chmod 755 {} +
    find "${pkgdir}" -type f -exec chmod 644 {} +

    install -Dm644 "${pkgdir}/usr/share/springseed/LICENSE" "${pkgdir}/usr/share/licenses/springseed/LICENSE"
    rm "${pkgdir}/usr/share/springseed/LICENSE"

    install -Dm644 "${srcdir}/springseed.desktop" "${pkgdir}/usr/share/applications/springseed.desktop"
    install -Dm644 "${srcdir}/springseed.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/springseed.svg"
    install -Dm755 "${srcdir}/springseed" "${pkgdir}/usr/share/springseed/springseed"

    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/springseed/springseed" "${pkgdir}/usr/bin/springseed"
}
