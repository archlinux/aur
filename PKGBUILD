# Maintainer: Andy Bao <contact at andybao dot me>
_appname=firefox-profile-switcher-connector
pkgname=${_appname}-bin
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.0.8
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
provides=("${_appname}")
conflicts=("${_appname}")
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
source_x86_64=("$pkgname-$pkgver-x86_64.rpm::$url/releases/download/v$pkgver/linux-x64.rpm")
source_i686=("$pkgname-$pkgver-i686.rpm::$url/releases/download/v$pkgver/linux-x86.rpm")
sha256sums_x86_64=('a1b9e64b5548a938fcd836dd504e6744962ac836911be9ca4b3c22a0ab1781de')
sha256sums_i686=('0122c5cd51fbba2bc95ca1fc08bc74b322443d8cdfad5d4592a9b9cd1c19ae5e')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm755 "$srcdir/usr/bin/ff-pswitch-connector" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/usr/lib/mozilla/native-messaging-hosts/ax.nd.profile_switcher_ff.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
}
