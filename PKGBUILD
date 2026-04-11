# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.10.0
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


sha256sums_x86_64=('d8527fb3a925130756dcb069dc1d983a9684b11fc8614561f419fcd9c94ed51a'
                   'fa42beea63afe3934d5dc39865811c405ea0ec6ce7afc6a513698e5ecbafa65c'
                   '6335a1ec5d308760871b52315cfc423eb4bbb096bd673a2ddbeb57836f2986d8'
                   '4a7c7912e986d4102ed42ee47901e497d3645830976a724c8a8b71e76cca543a')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-${pkgver}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"

    install -Dm 644 "$srcdir/${_pkgname}-${pkgver}-fselect-completion.bash" "$pkgdir/usr/share/bash-completion/completions/fselect-completion.bash"
}
