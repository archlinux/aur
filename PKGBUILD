# Maintainer: Siavash Askari Nasr <ciavash@protonmail.com>
pkgname=rakudo-bin
pkgver=2022.06_01
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
sha512sums=('d486f072b84681bce4338288c7fa39a7da516c8da0774c9656d37833aa745be0a5d471ea3a5083e21b262f89efb332194896c08b6671b9361b68c27fb3d7cba7'
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
