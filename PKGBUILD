pkgname=librewolf-extension-plasma-integration
pkgver=1.8.1
pkgrel=2
pkgdesc='Plasma browser integration addon for Librewolf'
arch=('any')
url='https://addons.mozilla.org/en-US/firefox/addon/plasma-integration/'
license=('GPLV3')
depends=('plasma-browser-integration')
groups=('librewolf-addons')
source=("extension.xpi::https://addons.mozilla.org/firefox/downloads/file/3859385/plasma_integration-${pkgver}-fx.xpi")
sha512sums=('47bb922787bed93fc8317a5cab99a4ac487bb7b7a95c98ee6ee59511c29f811082e224a992e0147f76bb3271e055b3651535c7da448b684fada1bd1444407fc0')
install=$pkgname.install

package() {
  install -Dm644 extension.xpi "${pkgdir}/usr/lib/librewolf/browser/extensions/plasma-browser-integration@kde.org.xpi"

  # https://librewolf.net/docs/faq/#how-do-i-get-native-messaging-to-work
  mkdir -p ${pkgdir}/usr/lib/librewolf
  ln -s /usr/lib/mozilla/native-messaging-hosts "${pkgdir}/usr/lib/librewolf/native-messaging-hosts"
}

