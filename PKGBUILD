# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>

pkgname=sidef
pkgver=2.33
pkgrel=1
pkgdesc="A modern object-oriented programming language."
arch=('any')
url="https://github.com/trizen/${pkgname}"
license=('Artistic2.0')

makedepends=()
depends=('perl>=5.22.0' 'perl-data-dump' 'perl-math-gmpq>=0.41' 'perl-math-gmpz>=0.39' 'perl-math-mpfr>=3.29' 'perl-math-mpc' 'perl-math-prime-util-gmp>=0.41')

source=("https://github.com/trizen/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('3865635893eb3f7098836aa36f4ff2a700c9a110a30a4541b11218b4dff0bcff')

package() {
    cd "$pkgname-$pkgver"

    perl Makefile.PL DESTDIR="$pkgdir" INSTALLDIRS=vendor INSTALLVENDORSCRIPT="/usr/bin"
    make &&
    make test &&
    make install

    #cd "share/sidef"
    #for i in *
    #do
    #    install -Dm644 "$i" "$pkgdir/usr/share/$pkgname/$i"
    #done
}
