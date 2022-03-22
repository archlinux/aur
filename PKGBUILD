# Maintainer: Andy Bao <contact at andybao dot me>
_appname=firefox-profile-switcher-connector
pkgname=${_appname}-bin
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.1.1
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
provides=("${_appname}")
conflicts=("${_appname}")
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
source_x86_64=("$pkgname-$pkgver-x86_64.rpm::$url/releases/download/v$pkgver/linux-x64.rpm")
source_i686=("$pkgname-$pkgver-i686.rpm::$url/releases/download/v$pkgver/linux-x86.rpm")
sha256sums_x86_64=('ff060d09f7fb66f6553024825986e8e2f5d654268cb00f9bbc289263cdd18b9b')
sha256sums_i686=('1150205bcbdab2fc1b20c08041912d0245fad62c6851dbb1919aaad01c4ba070')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm755 "$srcdir/usr/bin/ff-pswitch-connector" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/usr/lib/mozilla/native-messaging-hosts/ax.nd.profile_switcher_ff.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
}
