# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Sadoaz
_pkgname=vimalender
pkgname=${_pkgname}-bin
pkgdesc="A calendar with vim keybindings"

pkgver=1.0.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')
_barch=('linux_amd64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}")
sha256sums=('25ca3ccf2e059092aa7651fde606125a45f26609ea7746b609fdea28d71b7780'
            'e744fab298a55e291cb494d25a96ae70eadd4861dde0f6d64e89112e1ca128fb')
sha256sums_x86_64=('ae868a3f61954c8efce2c07e19e74075d2ad3e5cd97d6dc1bfb3c35bac35c1fb')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
