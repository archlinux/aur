# Maintainer Ashes Lawless <asalawless5c@gmail.com>
# Previous Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname="${_pkgname}-bin"
pkgver=1.29.0
pkgrel=2
pkgdesc='Debug adapter extraced from vscode-cpptools'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Microsoft/vscode-cpptools'
license=('LicenseRef-custom')
# depends=('lttng-ust2.12')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-x64.vsix")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm32.vsix")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm64.vsix")
b2sums_x86_64=('81381534209d314d6a0b9ce94dd4f2f163687e5af76e4fd2f6c571ef3dec4bd70eeb760f86bd12f97a37ccb41232a40eb18874cafe5d7ffd3c3d3fdca0790455')
b2sums_armv7h=('66184574c96caf37d97e14c2184d62fd37a239008e248c4c7297fec144fd7db4273dd0079eaaaeddff8c954c3ef14a3e37334cf501719b21c73cd9ddd7dcd9dc')
b2sums_aarch64=('8dfbb1f0d0320d6f4f07cc1f7f0291c6c46019482cc91d52a8ba6040a76b63d6dd363283a30c6db36d6c2d52bc635c0d4ce09e2bbf7d4de1c013090e9b02f572')

package() {
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
