# Maintainer: basigur

pkgname=plasma5-aurorae-theme-neru
pkgver=1.0
pkgrel=1
pkgdesc="Light and dark themes of the top bar for Arorae"
arch=(x86_64)
url="https://github.com/chistota/plasma5-aurorae-theme-neru"
license=('LGPL3')
depends=()
replaces=('plasma5-aurorae-theme-neru')
conflicts=()
groups=(plasma)
source=("https://github.com/chistota/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('16C33F14803DBE3574DE774DD82C0C76414D616CB5B199DF6544CFEACD445C36B7389D86573452322AB2DCB29DF2279D6FC37F70DA6B792D5A4B75499BF46F45')

package() {
    tar -xzf v${pkgver}.tar.gz
    cd "$srcdir"/"${pkgname}"-"$pkgver"

    install -d "$pkgdir/usr/share/aurorae/themes/NeruAuroraeLight"
    install -D -m644 NeruAurоrаеLight/*.svg "${pkgdir}"/usr/share/aurorae/themes/NeruAuroraeLight/
    install -D -m644 NeruAurоrаеLight/metadata.desktop "${pkgdir}"/usr/share/aurorae/themes/NeruAuroraeLight/metadata.desktop
    install -D -m644 NeruAurоrаеLight/NeruAurоrаеLightrc "${pkgdir}"/usr/share/aurorae/themes/NeruAuroraeLight/NeruAuroraeLightrc
    cp -r NeruAuroraeDark "${pkgdir}/usr/share/aurorae/themes/NeruAuroraeDark"

    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
    install -D -m644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
    install -D -m644 AUTHORS "${pkgdir}"/usr/share/doc/"${pkgname}"/AUTHORS

    sed -i 's!Светлая тема верхней панели Неру v1.0!Neru Aurorae Light v1.0!' $pkgdir/usr/share/aurorae/themes/NeruAuroraeLight/metadata.desktop
    sed -i 's!Темная тема верхней панели Неру v1.0!Neru Aurorae Dark v1.0!' $pkgdir/usr/share/aurorae/themes/NeruAuroraeDark/metadata.desktop

    sed -i 's!Неру-светлая!Neru-Light!' $pkgdir/usr/share/aurorae/themes/NeruAuroraeLight/metadata.desktop
    sed -i 's!Неру-темная!Neru-Dark!' $pkgdir/usr/share/aurorae/themes/NeruAuroraeDark/metadata.desktop

}
