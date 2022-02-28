# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.8.0
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

sha256sums_x86_64=('9602df9ff6635652acee2b98c3be06f8b01a6b466e977d28360b88509437d83d'
                   'ec7d4b71387c9ef3f401241376c92a925fb085cd984ea73658a1dd9deb7b6c19'
                   '76538d6539b9df46b8de8737c82c899b38caf7669fd52047ad78e25301d181d5')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"
}
