# Maintainer: arimxyer <https://github.com/arimxyer>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=arimxyer
_pkgname=models
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A fast TUI and CLI for browsing AI models, benchmarks, and coding agents"

pkgver=0.10.1
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
sha256sums=('ad16b1c16efaecd362f69e4b8749a8ad59424562af5cdc081a528d1551198072'
  '515175e700aadba7b5436688d6daa0e06ea17bfb657e377e14138f65866082a3')
sha256sums_x86_64=('3357f038929419d44ef1b0a4352652cdfc26bef5312a31fc2e25f315da73f173')
sha256sums_aarch64=('bd1b85019a4057078413739308a93d4ca756870e82c7fdb504b319006dde8d59')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
