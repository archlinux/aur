# Maintainer: Naoki Kanazawa <nk dot naoki912 at gmail dot com>
# Co-Maintainer: therojam <archlinux at therojam dot xyz>
pkgname=atomic-tweetdeck
pkgver=0.14.1
pkgrel=1
pkgdesc="Just a small Electron TweetDeck app."
arch=('any')
url="https://github.com/dogancelik/atomic-tweetdeck"
license=('MIT')
depends=('gtk2' 'gconf' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
source=(
    	"${url}/releases/download/v${pkgver}/atomic-tweetdeck-linux-x64.tgz"
	"atomic-tweetdeck.desktop"
)
md5sums=('f781e373f7561c316a956f7bf8133507'
         '6d0350843795b0e996d159e5dd6607bf')

package() {
    install -dm755 ${pkgdir}/usr/bin
    install -dm755 ${pkgdir}/usr/lib

    cp -a ${srcdir} ${pkgdir}/usr/lib/${pkgname}

    ln -s /usr/lib/atomic-tweetdeck/atomic-tweetdeck ${pkgdir}/usr/bin/atomic-tweetdeck

    install -Dm644 atomic-tweetdeck.desktop ${pkgdir}/usr/share/applications/atomic-tweetdeck.desktop
    install -Dm644 "${srcdir}/resources/app/favicon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

    unlink ${pkgdir}/usr/lib/${pkgname}/atomic-tweetdeck-linux-x64.tgz
    unlink ${pkgdir}/usr/lib/${pkgname}/atomic-tweetdeck.desktop
}
