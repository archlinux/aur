# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=rakudo-bin
pkgver=2024.05_01
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
sha512sums=('122de4af0ec881b0fe635ccff606fc4be8e730fdb1b05e890df1911c4c7b4c525209053d524bdacb312a95ae5ed8301ca9d0f8fd2bdf3d00a53dd8ef587d735b'
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
