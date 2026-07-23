# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=madLinux7
_pkgname=dssh
pkgname=${_pkgname}-bin
pkgdesc="The only SSH connection manager you'll ever need, with a TUI & CLI"

pkgver=2.2.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-amd64' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('248a44eaf0cfd7b3266d7e67f89ab740ac07eab455cb223fa5da6c7a6eda1fdb'
            'eba23c7b8bc084aa2579be5323b2d2ad1b9efca7caeca3a8cd1c273fa478484d')
sha256sums_x86_64=('ed94031fd8694a9a77a0692433d471cfcaa90709bc1a067c7cec4704f48146a7')
sha256sums_aarch64=('1c0e2c2fb57826160251e21d5d30f9ed06f85e6373f6eda38fa5f5af2c0979db')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
