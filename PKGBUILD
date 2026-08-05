# Maintainer: sekomi <sekomi at tuta.io>
pkgname=makko-beta-bin
pkgver=3.0.0
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
sha256sums=('7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3')
sha256sums_x86_64=('4e5733fbc50b6620b4fcd53de74ade154be616f1ceecebf5acf59a0833ed1b28')
sha256sums_aarch64=('8e97188952219485340b9e1b81d3ac05cfd33a13cd2534870a2562b4fb65af03')

package() {
    # Install binary
    install -Dm755 "${pkgname%-beta-bin}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/makko"

    # Install license file
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

