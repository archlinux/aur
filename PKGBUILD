# Maintainer: Ashes Lawless <asalawless5c@gmail.com>
# Previous Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname="${_pkgname}-bin"
pkgver=1.32.1
pkgrel=1
pkgdesc='Debug adapter extraced from vscode-cpptools'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/Microsoft/vscode-cpptools'
license=('LicenseRef-custom')
#depends=('zlib' 'lttng-ust2.12')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-x64.vsix")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm32.vsix")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.zip::https://github.com/microsoft/vscode-cpptools/releases/download/v${pkgver}/cpptools-linux-arm64.vsix")
b2sums_x86_64=('5643ba8edcee65932b27361008953d8dbd79454bd70d471bc9fcf7e5b40ec6df603f783fc02480de80c374206c2cfbee75892c0a6ad514eb2bd1fa704408d684')
b2sums_armv7h=('8dd146acba1322d3e1521844b5bb41ae18d00826e0db6615bc3cddf2e871d6c1217571f974467bf2ac8cdf371ee8d256fb989d05522ecfc2ca5e71a5ce12fdfa')
b2sums_aarch64=('1357ca2da4e89f1fbc96092e66aab370a5d70bf0bc346c7638e5fd072678cbd571119d41b063ca4e45e78573903d7f2b0b2b7ae5a42ca64c63920af84ef5630c')

package() {
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
