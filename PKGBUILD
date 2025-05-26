# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=rakudo-bin
pkgver=2025.05_01
pkgrel=1
pkgdesc="Raku compiler for MoarVM"
arch=('x86_64')
url='https://rakudo.org/'
license=(PerlArtistic)
groups=('raku')
provides=('rakudo-moar' 'perl6' 'raku' 'rakudo' 'nqp' 'moarvm' 'zef')
conflicts=('rakudo-moar' 'perl6' 'raku' 'rakudo' 'nqp' 'moarvm')
install="${pkgname}.install"
source=("https://rakudo.org/dl/${pkgname%-bin}/${pkgname%-bin}-moar-${pkgver//_/-}-linux-x86_64-gcc.tar.gz"
        "https://rakudo.org/dl/${pkgname%-bin}/${pkgname%-bin}-moar-${pkgver//_/-}-linux-x86_64-gcc.tar.gz.asc")
validpgpkeys=(
    # Patrick Böker
    'DB2BA39D1ED967B584D65D71C09FF113BB6410D0'
    # Alexander Kiryuhin
    'FE750D152426F3E50953176ADE8F8F5E97A8FCDE'
    # Justin DeVuyst
    '59E634736AFDCF9C6DBAC382602D51EACA887C01'
)
sha512sums=('c46aee2d47291f7c96f87a1af22fbbf79e0abd413dd75e1db4b21c91b3f75ffdb01189c6b403e541e8700c40144008556288af5e69b6032746fcd465646574c3'
            'SKIP')

package() {
    cd "${pkgname%-bin}-moar-${pkgver//_/-}-linux-x86_64-gcc"

    install -dm755 ${pkgdir}/usr/

    cp -r bin ${pkgdir}/usr/
    cp -r share ${pkgdir}/usr/
    cp -r lib ${pkgdir}/usr/
    cp -r include ${pkgdir}/usr/

    install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname%-bin}/README.md
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE
}
