# Maintainer: Mahmoud Elswerky <mahmoud dot elswerky at gmail dot com>
# Contributor: Chris Down <chris@chrisdown.name>
# Contributor: Yung Wood <yung at yung.com.au>
# Contributor: Joshua Stiefer <facedelajunk at gmail.com>
# Contributor: Michael Seiwald <michael at mseiwald.at>
# Contributor: Techlive Zheng <techlivezheng at gmail.com>
# Contributor: ava1ar <mail(at)ava1ar(dot)me>
# Contributor: Albert Westra <odsseywestra(at)gmail(dot)com>
# Contributor: Darren Wu <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>
# Contributor: Mark Wagie <yochanan dot marqos at gmail dot com>

pkgname=lastpass-pocket
pkgver=4.1.20
pkgrel=3
pkgdesc="Backup and offline access for LastPass"
arch=('x86_64')
url="https://lastpass.com"
license=('custom:LastPass')
options=('!strip')
depends=('ca-certificates' 'openssl-1.0' 'libldap' 'libidn' 'gtk2' 'libpng12' 'librtmp0')
source=('lastpass.desktop'
        'lastpass.png'
        "pocket_x64_${pkgver}.tar.bz2::https://download.cloud.lastpass.com/pocket/pocket_x64.tar.bz2")
sha1sums=('4e8258a93d2a72c86abc916fee1faab0d34fc8a7'
          '043994fdbb2af48eadb17e2ffe48a9a1652c297b'
          '893ec51711f1030ed575b895fef145982124496d')

package() {
  install -Dm755 pocket_x64 "${pkgdir}/usr/bin/lastpass"
  install -Dm644 lastpass.png "${pkgdir}/usr/share/icons/lastpass.png"
  install -Dm644 lastpass.desktop "${pkgdir}/usr/share/applications/lastpass.desktop"
}
