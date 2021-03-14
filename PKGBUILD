# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.3
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

sha256sums_x86_64=(
    # bin pkg sum
    '9150470105824b0bfd284caa0029a7b22b9d149b30edaba5f3cc05d426a6db76'
    # man page sum
    'e7467281dc4479444cb33ef087877ff304367e653e6a0922dec64364f33b3c91'
    # usage.md
    'b61c2fafafed78e0cd863766ecd0c856ca05a342e7cd85d8b8898dfd769a44cb'
)


package() {
    install -Dm 755 "$srcdir/${_pkgname}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"
}
