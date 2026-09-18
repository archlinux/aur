# Maintainer: 4censord <mail+aur@4censord.de>
# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.10.3
pkgrel=3
pkgdesc='Find files with SQL-like queries'
url="https://github.com/jhspetersson/${_pkgname}"
license=('MIT OR Apache-2.0')
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
    # MIT license file
    "${_pkgname}-${pkgver}-license-mit::https://raw.githubusercontent.com/jhspetersson/${_pkgname}/${pkgver}/LICENSE-MIT"
)


sha256sums_x86_64=('01e25f362c04e41e565216b70b4859e8bfe27038fa3a240810ca954247364864'
                   '68c4e9ebbc83692d0d16e9d6b095f62ca6b28a703f954e9978b97335ea918b99'
                   '86ffc4c67e1774b03a86db96ee935b3048a4ebdd967dd230e4f0277da7eb778e'
                   '4a7c7912e986d4102ed42ee47901e497d3645830976a724c8a8b71e76cca543a'
                   '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-license-mit" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-fselect-completion.bash" "$pkgdir/usr/share/bash-completion/completions/fselect-completion.bash"
}
