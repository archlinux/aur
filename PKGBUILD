# Maintainer: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=fselect-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.9
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

sha256sums_x86_64=('9b4d01cd9004585503afec41fb2b491f6b13636c6f64b7933a2ba9d84d0aa4df'
                   'ec7d4b71387c9ef3f401241376c92a925fb085cd984ea73658a1dd9deb7b6c19'
                   '12a724ec4bb4f46b468ee8f61cd98f175d5fbca6c51995b85dae91963c349c37')


package() {
    install -Dm 755 "$srcdir/${_pkgname}-x86_64-linux-musl" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm 644 "$srcdir/${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}.1"
    install -Dm 644 "$srcdir/usage.md" "$pkgdir/usr/share/doc/${_pkgname}/usage.md"
}
