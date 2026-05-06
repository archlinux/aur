# Maintainer: sekomi <sekomi at tuta.io>
pkgname=makko-beta-bin
pkgver=3.0.0_pre
pkgrel=1
pkgdesc='A simple Static Site Generator written in Zig (prerelease version).'
arch=('x86_64' 'aarch64')
url='https://makko.starlightnet.work/'
_source_url='https://forge.starlightnet.work/Team/Makko'
license=('Zlib')
provides=('makko')
conflicts=('makko')
options=(!strip !debug) 
source=("${_source_url}/raw/branch/main/LICENSE")
source_x86_64=("${pkgname%-beta-bin}-${pkgver}-x86_64::${_source_url}/releases/download/${pkgver//_/-}/makko-x86_64-linux")
source_aarch64=("${pkgname%-beta-bin}-${pkgver}-aarch64::${_source_url}/releases/download/${pkgver//_/-}/makko-aarch64-linux")
sha256sums=('SKIP')
sha256sums_x86_64=('c9500290f5125ff6204436d237f65785fcc7c280b508830332e8fc5c9c43628e')
sha256sums_aarch64=('4f7a5ac44e9b46ed958810b57009fb411198abf12c5e15b3f674e3e54cf50be0')

package() {
    # Install binary
    install -Dm755 "${pkgname%-beta-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/makko"

    # Install license file
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

