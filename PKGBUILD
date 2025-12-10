# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.9.2
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


sha256sums_x86_64=('e36604fd334911abce03e89609c601f3bd3b7176bd3ffe4409be8f55de583e24'
                   'a84621609805fe4f9cba3a2d40ebbf7b738fc3f45a9de88ea4325d0c51e1ab66'
                   '8f4b21a9e1c8cccc1a3069b8836f96f81c3df4653d6aa97f1a0cbb025c2455b6'
                   '4a7c7912e986d4102ed42ee47901e497d3645830976a724c8a8b71e76cca543a')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-fselect-completion.bash" "$pkgdir/usr/share/bash-completion/completions/fselect-completion.bash"
}
