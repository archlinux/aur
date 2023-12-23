# Maintainer: Kotz <kotz at getgoogleoff dot me>

pkgname='json2sharp-bin'
pkgver='1.1.0.0'
pkgrel=2
pkgdesc='CLI tool for converting JSON objects to class definitions'
arch=('x86_64' 'aarch64')
url='https://github.com/Kaoticz/Json2Sharp'
license=('Apache-2.0')
provides=('json2sharp')
options=('!strip')
source_x86_64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-x64.zip")
source_aarch64=("https://github.com/Kaoticz/Json2Sharp/releases/download/${pkgver}/Json2Sharp_linux-arm64.zip")
sha256sums_x86_64=('d9567184afff4466a5d089651a2b1f93f189d64a9715e01dc0d45d581ea8e31c')
sha256sums_aarch64=('c222db12eb1fc141bb24c6cf9a9397bf7f9aeb6408a67e2e33e9d8146d4770fb')

package()
{
    install -Dm755 "${srcdir}/Json2Sharp_linux-x64/json2sharp" "${pkgdir}/usr/bin/json2sharp"

    # Delete the zip file
    rm "$(readlink -f "${srcdir}/Json2Sharp_linux-x64.zip")"
}
