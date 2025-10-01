# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=cryptaliagy
_pkgname=tomlq
_pkgexec=tq
pkgname=${_pkgname}-bin
pkgver=0.2.2
_pkgvername=${pkgver}
pkgrel=1
pkgdesc="Tool for getting data from TOML files"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('MIT')

provides=("${_pkgexec}")
conflicts=("${_pkgname}"{,-git})

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}.${_barch[0]}.tgz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}.${_barch[1]}.tgz")
sha256sums=('c85a1e732dfe5e23363acd758fee6fc4828a485189ff108188426ce6a798ab8c'
            '0f80d6d8dd7d456e20d6165113eca6f140f136adfa59f9e00685c0a996ce0341')
sha256sums_x86_64=('0a4d41836e215e1d9b0a23d8b95291062c28b2a37f2d4736983ae4e0e308dd27')
sha256sums_aarch64=('aef9816f27896fea492191b3b7b32f73a12ea3980343aca83d65e3ed048f9dc8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
