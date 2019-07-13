# Maintainer: João Marcos <marcospb19@hotmail.com>

pkgname=corrupter-bin
_pkgname=${pkgname%-bin}
pkgver=1.0
pkgrel=1
provides=(${_pkgname})

# Second argument is temporary, only while corrupter-git package don't adjust the conflicts to (corrupter)
conflicts=(${_pkgname} "${_pkgname}-git")

pkgdesc='Simple image glitcher for producing nice i3lock backgrounds - Binary version'
url="https://github.com/r00tman/${_pkgname}"
arch=('x86_64')
license=('BSD 2-Clause')
makedepends=()

source=("${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_x86_64.tar.gz")
md5sums=('04f1c9c324d12717b10c5173a5363f25')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
