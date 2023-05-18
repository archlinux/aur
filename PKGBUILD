# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.3
pkgrel=1
pkgdesc='Find files with SQL-like queries'
url="https://github.com/jhspetersson/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')

source_x86_64=(
    "${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-musl.gz"
    # man page
    "https://raw.githubusercontent.com/jhspetersson/${_pkgname}/${pkgver}/docs/${_pkgname}.1"
    # more detailed document on usage
    "https://raw.githubusercontent.com/jhspetersson/${_pkgname}/${pkgver}/docs/usage.md"
)

sha256sums_x86_64=('f554f6b59c7d8a601dd38de33433d31c35e271903d3a0473daf8b09a235ab2fd'
                   'bb4b4ee7c2bf4ef481815f5e5310edad9c932acb92efcb9dcf02681458fb370a'
                   'ce7fa0c9a52176c5e7af21616f5aa02a95193720a57b2cd631dc8fd82f6c600b')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"
}
