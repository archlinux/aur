# Maintainer: sekomi <sekomi at tuta.io>
pkgname=makko-bin
pkgver=2.1.2
pkgrel=2
pkgdesc='A simple Static Site Generator written in Zig (stable version).'
arch=('x86_64' 'aarch64')
url='https://makko.starlightnet.work/'
_source_url='https://forge.starlightnet.work/Team/Makko'
license=('Zlib')
provides=('makko')
conflicts=('makko')
options=(!strip !debug) 
source=("${_source_url}/raw/branch/main/LICENSE")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64::${_source_url}/releases/download/${pkgver}/makko-x86_64-linux")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64::${_source_url}/releases/download/${pkgver}/makko-aarch64-linux")
sha256sums=('SKIP')
sha256sums_x86_64=('ef838bbcea1295a66a8315f6204d364d2bfa24a5570e4c86f426757b292b1e9c')
sha256sums_aarch64=('5b8bea05120c43315b0a102f3b53010d80f113026445c328d938092ef9684600')

package() {
    # Install binary
    install -Dm755 "${pkgname%-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/makko"

    # Install license file
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

