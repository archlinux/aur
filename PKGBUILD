# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname=cpptools-debug-bin
pkgver=1.21.3
pkgrel=1
pkgdesc='Debug adapter extraced from vscode-cpptools'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Microsoft/vscode-cpptools'
license=('LicenseRef-custom')
# depends=('lttng-ust2.12')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("extension_x86_64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-x64.vsix")
source_armv7h=("extension_armv7h.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm32.vsix")
source_aarch64=("extension_aarch64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm64.vsix")
b2sums_x86_64=('34c72891c8e695fe0595bb1c858164a97a01ae79bfb38bef11dee2e4de591779be850f2dcb7b451b129e680d80c4807e3bf33507aa436d8624be4ad5c16183fa')
b2sums_armv7h=('922905db764a333ece26e7a9a2b9bffa12321e84475eb7349ac3d2fc6541e807fb444b9ef1889857e339519853d46fbd142b9478e5c6433258037d349d8e4da1')
b2sums_aarch64=('2662e9e410cadfaa4a654c943253aa5f604aae8eb909eff798a993d986738522a491640f254113796d4a381907d53c6aad70a02ea74c34e4b5f3785bcd522a56')

package() {
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
	chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
