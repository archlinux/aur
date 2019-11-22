# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=ttf-twemoji
pkgver=12.1.4
pkgrel=1
_fedrel=1.fc32
pkgdesc="Twitter Emoji for everyone."
url="https://github.com/twitter/twemoji"
arch=(any)
license=('CCPL' 'MIT' 'Apache')
depends=('fontconfig')
provides=('emoji-font')
install="$pkgname.install"
source=("https://archives.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/t/twitter-twemoji-fonts-${pkgver}-${_fedrel}.noarch.rpm"
        "75-twemoji.conf")
sha256sums=('5c3513c60608e159561d655eeca29cdc58373d39848300f4624fa76c49d8285d'
            'fe8a61709b0f262e84224fdedd86bbf0175b191079e2eb5a3a03a30a4ed449ea')

package() {
  install -Dm644 usr/share/fonts/twemoji/Twemoji.ttf \
    "${pkgdir}/usr/share/fonts/twemoji/twemoji.ttf"
  install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" 75-twemoji.conf
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    usr/share/licenses/twitter-twemoji-fonts/LICENSE{,-{BUILD,GRAPHICS}}
}
# vim:set ts=2 sw=2 et:
