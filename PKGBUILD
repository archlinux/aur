# Maintainer: Eugen Zagorodniy <https://github.com/ezag>

pkgname=e4thcom
pkgver=0.8.0
pkgrel=1
pkgdesc='Terminal for Embedded Forth Systems'
arch=('x86_64')
url="https://wiki.forth-ev.de/doku.php/en:projects:${pkgname}"
license=('GPL3')

source=(
    "https://wiki.forth-ev.de/lib/exe/fetch.php/projects:$pkgname:$pkgname-$pkgver-64.tar.gz"
    "e4thcom"
)
sha256sums=(
    '41560a3e2a013c850b853fb7079d3ee9820020ea8f34d3af95b2ed733a193035'
    'e730ca08860806a2f4ad029adb9129a76499a0c661202f104141e8bd31ca9a74'
)

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    ./lxmake 64
}
package() {
    install -Dm 755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname-$pkgver/doc/e4thcom-0.8.0.pdf"  \
                   "$pkgdir/usr/share/doc/$pkgname/$pkgname.pdf"


    mkdir -p "${pkgdir}/usr/lib/$pkgname/"
    cd "$_"

    install -m755 "$srcdir/$pkgname-$pkgver/$pkgname" $pkgname
    install -m644 "$srcdir/$pkgname-$pkgver/$pkgname.i" $pkgname.i

    install -m644 "$srcdir/$pkgname-$pkgver/430camelforth-xas.efc" 430camelforth-xas.efc
    install -m644 "$srcdir/$pkgname-$pkgver/430camelforth.efc" 430camelforth.efc
    install -m644 "$srcdir/$pkgname-$pkgver/430eforth-xas.efc" 430eforth-xas.efc
    install -m644 "$srcdir/$pkgname-$pkgver/430eforth.efc" 430eforth.efc
    install -m644 "$srcdir/$pkgname-$pkgver/4e4th-xas.efc" 4e4th-xas.efc
    install -m644 "$srcdir/$pkgname-$pkgver/4e4th.efc" 4e4th.efc
    install -m644 "$srcdir/$pkgname-$pkgver/amforth-xas.efc" amforth-xas.efc
    install -m644 "$srcdir/$pkgname-$pkgver/amforth.efc" amforth.efc
    install -m644 "$srcdir/$pkgname-$pkgver/amforth.efc" amforth.efc
    install -m644 "$srcdir/$pkgname-$pkgver/anyforth.efc" anyforth.efc
    install -m644 "$srcdir/$pkgname-$pkgver/mecrisp-msp430xas.efc" mecrisp-msp430xas.efc
    install -m644 "$srcdir/$pkgname-$pkgver/mecrisp-st.efc" mecrisp-st.efc
    install -m644 "$srcdir/$pkgname-$pkgver/mecrisp.efc" mecrisp.efc
    install -m644 "$srcdir/$pkgname-$pkgver/noforth-xas.efc" noforth-xas.efc
    install -m644 "$srcdir/$pkgname-$pkgver/noforth.efc" noforth.efc
    install -m644 "$srcdir/$pkgname-$pkgver/stm8ef.efc" stm8ef.efc
    install -m644 "$srcdir/$pkgname-$pkgver/test.efc" test.efc
    install -m644 "$srcdir/$pkgname-$pkgver/4e4th.efc" 4e4th.efc

    install -m644 "$srcdir/$pkgname-$pkgver/avrxasm.efx" avrxasm.efx
    install -m644 "$srcdir/$pkgname-$pkgver/msp430xas.efx" msp430xas.efx
    install -m644 "$srcdir/$pkgname-$pkgver/msp430xdas.efx" msp430xdas

    install -m644 "$srcdir/$pkgname-$pkgver/MSP430G2553.efr" MSP430G2553.efr
}
