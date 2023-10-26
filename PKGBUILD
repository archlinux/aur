# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=iptv-checker
pkgver=0.27.0
pkgrel=1
pkgdesc="Node.js CLI tool for checking links in IPTV playlists"
arch=('any')
url="https://github.com/freearhey/iptv-checker"
license=('MIT')
depends=('nodejs' 'ffmpeg')
makedepends=('npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('5706ab25b53e2881cb741aaf2fe8d8466a340d3aa5a1d50e268f3789f4879d4a')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -s "/usr/lib/node_modules/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
