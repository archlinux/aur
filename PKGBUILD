# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
pkgname=toa
pkgver=0.0.1
pkgrel=1
pkgdesc='"toa" is simple music player made by Electron.'
arch=('any')
url='https://github.com/yuki540net/toa'
license=('MIT')
depends=('gtk2' 'gconf' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib' 'xdg-utils')
makedepends=('gendesk')
source=(
    "${url}/releases/download/v${pkgver}/-linux-x64.zip"
)
md5sums=(
    '99cd3e38d68ab0949ebd4cc08d63f304'
)

prepare() {
    gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/usr/lib

    cp -a ${srcdir}/兎亜-linux-x64 ${pkgdir}/usr/lib/${pkgname}

    ln -s /usr/lib/toa/兎亜 ${pkgdir}/usr/bin/toa

    install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
