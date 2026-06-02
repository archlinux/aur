# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.10.1
pkgrel=3
pkgdesc='Find files with SQL-like queries'
url="https://github.com/jhspetersson/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')

source_x86_64=(
    "${_pkgname}-${pkgver}-x86_64-linux-musl.gz::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-linux-musl.gz"
    # man page
    "${_pkgname}-${pkgver}.1::https://raw.githubusercontent.com/jhspetersson/${_pkgname}/${pkgver}/docs/${_pkgname}.1"
    # more detailed document on usage
    "${_pkgname}-${pkgver}-usage.md::https://raw.githubusercontent.com/jhspetersson/${_pkgname}/${pkgver}/docs/usage.md"
    # bash completions
    "${_pkgname}-${pkgver}-fselect-completion.bash::https://raw.githubusercontent.com/jhspetersson/${_pkgname}/${pkgver}/fselect-completion.bash"
)


sha256sums_x86_64=('facbe289a33d974b1e85af16ff10d35ce042def72e1f0cc1ac328372eb8bbaec'
                   'c57f2491414ce8858008c702c6998fefe5f013b34d1a035636b66b27dfb4af0d'
                   '8d8a0fda810d8a383ff037cd9a4f93b20ce1676ea599a7aeedd1c7808239e129'
                   '4a7c7912e986d4102ed42ee47901e497d3645830976a724c8a8b71e76cca543a')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-fselect-completion.bash" "$pkgdir/usr/share/bash-completion/completions/fselect-completion.bash"
}
