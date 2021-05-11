# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.5
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

sha256sums_x86_64=('1047ba0cb78f89b05244a3aac8d9c16a024399ae9a88a28fab163d909b916cde'
                   'ec7d4b71387c9ef3f401241376c92a925fb085cd984ea73658a1dd9deb7b6c19'
                   'c4ce895d6224879cae6918558baa506969848f3de480146a14cf0bb4618c1fdb')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"
}
