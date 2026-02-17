# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arimxyer
_pkgname=models
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A fast CLI and TUI for browsing AI models and coding agents"

pkgver=0.8.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64-unknown-linux-gnu' 'aarch64-unknown-linux-gnu')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('libgcc' 'glibc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
        "LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_appname}-${_barch[1]}.tar.gz")
sha256sums=('9a0e5356f89557b448d52c4620c614e793af6f0d961bea64dcc0f828c55481b3'
            '515175e700aadba7b5436688d6daa0e06ea17bfb657e377e14138f65866082a3')
sha256sums_x86_64=('fac9799a62ca262249ccf97e2930e84bc56e450a0f97177af9112562df775f25')
sha256sums_aarch64=('626bc41967d18a422978283cc7af3cb37241f088279ac911e78146cacaafb96a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
