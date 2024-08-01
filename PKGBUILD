# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname=cpptools-debug-bin
pkgver=1.21.5
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
b2sums_x86_64=('36e49974b1cfa2e36f2c8d7478e219ec892bd75a46593016e0595ddcae99482d4b2d3c114d676a68b0c18869f14691a81b927722784aeda5ee38e0d6893921d9')
b2sums_armv7h=('9b4fc24b059ce2a203e7945f861ac45b7085c978908b08d880efa759aab460ddfb5b4e9ed2b80255321e5d092a008980e107137a43d856e16c19d540c981848c')
b2sums_aarch64=('68d2149bec50027787481d45cc58a02270fc90dc19da50fe811dd2f51c67010457cc859274456e9f3ed7d9d853b664c72dcb5d97f198c4c0a9d4d088e2324a4e')

package() {
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
	chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
