# Maintainer: arimxyer <https://github.com/arimxyer>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=reyamira
_pkgname=models
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgdesc="A fast TUI and CLI for browsing AI models, benchmarks, and coding agents"

pkgver=0.12.0
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
sha256sums=('37688659bf926e5899f6f83791038163dca2426eff96a87269859bec2ed3ca81'
  '655afc9320c8924f037bfe9b00b2d95c7dd085f6626a9f2ec30143929d192a4d')
sha256sums_x86_64=('e5d31c30cd0441e42a92fa980ebc03de0c43a89d7b8d89931e5fe74b5bdbb198')
sha256sums_aarch64=('162444712a4384e62f3ea6a670abba2853a6fdd9347597e155773daebdf48026')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
