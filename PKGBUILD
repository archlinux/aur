# Maintainer: arimxyer <https://github.com/arimxyer>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arimxyer
_pkgname=models
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A fast TUI and CLI for browsing AI models, benchmarks, and coding agents"

pkgver=0.11.1
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
sha256sums=('da4543e2149e2257e0b995b24c5cf3a6ec8b9c095b1f75329226df2272ef2c59'
  '515175e700aadba7b5436688d6daa0e06ea17bfb657e377e14138f65866082a3')
sha256sums_x86_64=('5bb7e74418afdffed1f0602445938c49f91b66385b4d8abb27d4c1192ad77b9a')
sha256sums_aarch64=('71fd4e1b7a34d67656231e19f85edb8bcf7eb7284f4d5d89158257bef3631607')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
