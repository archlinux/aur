# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname="${_pkgname}-bin"
pkgver=1.23.5
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
b2sums_x86_64=('e86ec6ae6ecbdd210e80b8c440d28c633c4241296f82c03d96f8529f69733862b80c53d8a691590af0dbc3b96c9ba074a3fba57451abdb77a7a10c4f0c21f23a')
b2sums_armv7h=('01689595edbb258ee9966063b1f428431d26be0478053f9ca39033c7dea50a2150d6751c7bc1d470d66c59abed90d460d2e88194d897daed5087abedb446ad30')
b2sums_aarch64=('63fcde79025f4327769d24d06610bad4aacdc2aae5de76856b01de56ad7f9641852ba20210919ecd1e3b25eda93f5ee069c17c75677f28d46ccffb2609d79c4d')

package() {
	install -dm755 "${pkgdir}/usr/share/${_pkgname}"
	cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
	chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
