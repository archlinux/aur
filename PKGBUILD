# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=rakudo-bin
pkgver=2022.04_01
pkgrel=1
pkgdesc="Raku compiler for MoarVM"
arch=('x86_64')
url='https://rakudo.org/'
license=(PerlArtistic)
groups=('raku')
provides=('rakudo-moar' 'perl6' 'raku' 'nqp' 'moarvm' 'zef')
conflicts=('rakudo-moar' 'perl6' 'raku' 'nqp' 'moarvm')
install="${pkgname}.install"
source=("https://rakudo.org/dl/${pkgname%-bin}/${pkgname%-bin}-moar-${pkgver//_/-}-linux-x86_64-gcc.tar.gz"
        "https://rakudo.org/dl/${pkgname%-bin}/${pkgname%-bin}-moar-${pkgver//_/-}-linux-x86_64-gcc.tar.gz.asc")
validpgpkeys=('DB2BA39D1ED967B584D65D71C09FF113BB6410D0')
sha512sums=('5da371bcada4476c9bc9ad11aa1a26246c3c7effd22a39c6041353d18a49c7a56cf50a496b80bb3d50215cb2c0bfc25f68edd2b8e30a299d539d287eb1eca2e6'
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
