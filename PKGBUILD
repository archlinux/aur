# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=rakudo-bin
pkgver=2023.11_01
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
validpgpkeys=('DB2BA39D1ED967B584D65D71C09FF113BB6410D0')
sha512sums=('2d6c9ad1ffbe631f528a8cdf3bdb4fc7e7107cd94af8e64bb8a7aa78bae34d7c79a335e42db9179dde0e2fea5dbf7576b0cad9e5166471c11165950151b2c8af'
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
