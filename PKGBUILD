# Maintainer: librewish <librewish@garudalinux.org>
# Maintainer: dr460nf1r3 <dr460nf1r3 at garudalinux dot org>

pkgname=firedragon-extension-plasma-integration
pkgver=1.8.1
pkgrel=2
pkgdesc='Plasma browser integration addon for FireDragon'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/'
license=('GPLV3')
depends=('firedragon' 'plasma-browser-integration')
groups=('firedragon-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3859385/plasma_integration-${pkgver}-fx.xpi")
md5sums=('70d453da327555c502642411910e317c')
install=$pkgname.install

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/firedragon/browser/extensions/plasma-browser-integration@kde.org.xpi"

  # https://librewolf.net/docs/faq/#how-do-i-get-native-messaging-to-work
  mkdir ${pkgdir}/usr/lib/firedragon
  ln -s /usr/lib/mozilla/native-messaging-hosts "${pkgdir}/usr/lib/firedragon/native-messaging-hosts"
}
