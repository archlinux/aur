# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=taskr
pkgname=${_pkgname}-bin
pkgdesc="A terminal-native task runner that reads your existing .vscode/tasks.json and gives you concurrent execution, colored labeled logs, an interactive TUI, smart file watching, and more..."

pkgver=0.1.8
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('73ddb87848823468f600b371133c30528c04cf2000b6c4394ba2705dc9b07d5e'
            'f6e09a7cbeb53d1a2028751b614b7bb17205b28065c52682c9157d91a292bef5')
sha256sums_x86_64=('548839b7dac624c98e64c4e5c74fd3108e551360f5f14025aec4beedd0a541b4')
sha256sums_aarch64=('4702fa9f527dfc12d8b30a9386d7854d4e664668620c4e30e3b4b09ebd157d05')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
