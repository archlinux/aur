# Maintainer: 4censord <mail+aur@4censord.de>
# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.10.4
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


sha256sums_x86_64=('769f961c300fb790259fa8b6e54a09f2b4d661c7c4d8af1e1528bdaab6da45c1'
                   '0ca10b70215997c58f7fdb6218055e109b40787f2236cb997fe1dfc21acf9086'
                   'd8effb6f0505c0ed2f2977d66ddbc06f714bec94738bc2e3eb9d9c65f74e2034'
                   '4a7c7912e986d4102ed42ee47901e497d3645830976a724c8a8b71e76cca543a'
                   '23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-license-mit" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-fselect-completion.bash" "$pkgdir/usr/share/bash-completion/completions/fselect-completion.bash"
}
