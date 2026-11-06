# Maintainer: Ashes Lawless <asalawless5c@gmail.com>
# Previous Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@proton.me>
_pkgname=cpptools-debug
pkgname="${_pkgname}-bin"
pkgver=1.35.6
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
b2sums_x86_64=('968cc4a9a44122f0f0bd2f1e8e9ad7d6c0802fc5bff095eab149f65536c92165d66439848e4c268bb6135baf25ca64544a7f38ab5b5ca14d0d9a4ed87fd392f2')
b2sums_armv7h=('2d524ee1d9e0b1af4d899e816ae5428b442b4af7e3f24b8a17bb9b1d93937cc68df8b36238af397b7567f324afbd79fd03c45d0dedadd7db92ae49c0e9294316')
b2sums_aarch64=('d82f913c247d51317c512c2d538f23cbd401be2897ea4dc9081c41df6fe564d4abb936788a205f3f4e21bff9dae958596dada5c1f98bb640440789d4dd04ff0a')

package() {
    install -dm755 "${pkgdir}/usr/share/${_pkgname}"
    cp -r "${srcdir}/extension/debugAdapters"/. "${pkgdir}/usr/share/${_pkgname}"
    chmod +x "${pkgdir}/usr/share/${_pkgname}/bin/OpenDebugAD7"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${_pkgname}/bin/OpenDebugAD7" "${pkgdir}/usr/bin/cppdbg"
    install -Dm644 "${srcdir}/extension/bin/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
