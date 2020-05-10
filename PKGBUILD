# Maintainer: Parham < parham at tuta dot io >

pkgname=ttf-twemoji
pkgver=13.0.0
pkgrel=1
_fedrel=1.fc33
pkgdesc="Twitter Emoji for everyone."
url="https://github.com/twitter/twemoji"
arch=(any)
license=('CCPL' 'MIT' 'Apache')
depends=('fontconfig')
provides=('emoji-font')
install="$pkgname.install"
source=("https://kojipkgs.fedoraproject.org//packages/twitter-twemoji-fonts/${pkgver}/${_fedrel}/noarch/twitter-twemoji-fonts-${pkgver}-${_fedrel}.noarch.rpm"
        "75-twemoji.conf")
sha256sums=('63f6490401fa56d7a1a05026849cefc492b8c15804bcc7a7dd53f4c360d87df6'
            'a77a7775557efc1c17781c0fc35a0f7ec5ccd58f233573f8875032fb8575680e')

package() {
    install -Dm644 usr/share/fonts/twemoji/Twemoji.ttf \
      "${pkgdir}/usr/share/fonts/twemoji/twemoji.ttf"
    install -Dm644 -t "$pkgdir/etc/fonts/conf.avail" 75-twemoji.conf
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
      usr/share/licenses/twitter-twemoji-fonts/LICENSE{,-{BUILD,GRAPHICS}}
}
# vim:set ts=4 sw=4 et:
