#Maintainer: Plague-doctor <plague <at>> privacyrequired <<dot>> com >

pkgname=spw
pkgver=1.6
pkgrel=1
pkgcommit="957b956a7b40328df273c4a3bf198335e6cf1136"
pkgdesc="spw - secure password generator"
arch=('any')
url="https://gitlab.com/Plague_Doctor/spw"
license=('GPL')
depends=('python')
source=("spw-$pkgver-$pkgrel.tar.bz2"::"https://gitlab.com/Plague_Doctor/spw/repository/archive.tar.bz2?ref=$pkgver")
sha256sums=('12bd1d225dd66cb593d0a7136d138ae498ed7ac67b7359ae6ef406c3264070d4')

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

package() {
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/man/man1/"
    install -d "$pkgdir/usr/share/dict/"
    install "$srcdir/$pkgname-$pkgver-$pkgcommit/spw.py" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgcommit/dict/spw_en" "${pkgdir}/usr/share/dict/spw_en"
    install -Dm644 "$srcdir/$pkgname-$pkgver-$pkgcommit/man/spw.1" "${pkgdir}/usr/share/man/man1/"
}
