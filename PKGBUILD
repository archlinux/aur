# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=waterfox-slim-bin
pkgver=53.0
pkgrel=1
pkgdesc="
'Slim Edition' of the free, open and private browser. It doesn't contains language packs. They are as optional separate packages."
arch=('x86_64')
url="https://www.waterfoxproject.org/"
license=('MPL')
depends=('alsa-lib' 'libxt' 'mime-types' 'dbus-glib' 'hunspell' 'gtk2' 'gtk3' 'nss')
optdepends=('waterfox-kde-bin: KDE Plasma integration features'
            'waterfox-slim-i18n: Language packs for Waterfox'
            'networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'speech-dispatcher: Text-to-Speech')
conflicts=("waterfox-bin}")
provides=("waterfox-bin}")
options=('!emptydirs' '!strip')
source=("waterfox_${pkgver}_amd64.deb::https://hawkeye116477.github.io/waterfox-deb/pool/main/w/waterfox/waterfox_${pkgver}_amd64.deb")

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Moving stuff in place..."
  
  # Use system-provided dictionaries. Hunspell symlink is in deb.
  ln -Ts /usr/share/hyphen "$pkgdir/opt/waterfox/hyphenation"
}
sha256sums=('3a9f0d940122f8f9e7b8521c6c9078ab853c284f5f4b49deeb9c8f92bca89734')
