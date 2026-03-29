# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=taskr
pkgname=${_pkgname}-bin
pkgdesc="A terminal-native task runner that reads your existing .vscode/tasks.json and gives you concurrent execution, colored labeled logs, an interactive TUI, smart file watching, and more..."

pkgver=0.1.7
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
sha256sums=('2409dbf99c02616416b2029e4fc46655d63dbfebca7246dd30842053f70cfc39'
            'f6e09a7cbeb53d1a2028751b614b7bb17205b28065c52682c9157d91a292bef5')
sha256sums_x86_64=('9d743e555adb533ec4919883da77eb1fa76f9a1ce80f05ba490e55139c7813c2')
sha256sums_aarch64=('29a37fc2b9741e9bf35fc4a055c6024a6df341a6f77777e1a5e7d0bf574900e3')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
