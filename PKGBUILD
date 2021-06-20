# Maintainer: Andy Bao <contact at andybao dot me>
_appname=firefox-profile-switcher-connector
pkgname=${_appname}-bin
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.0.7
pkgrel=2
arch=('x86_64' 'i686')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
provides=("${_appname}")
conflicts=("${_appname}")
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
source_x86_64=("$pkgname-$pkgver-x86_64.rpm::$url/releases/download/v$pkgver/linux-x64.rpm")
source_i686=("$pkgname-$pkgver-i686.rpm::$url/releases/download/v$pkgver/linux-x86.rpm")
sha256sums_x86_64=('bcf24236fc43e935d1822c00cd7bc790961f02b930d161f5aa2712be15a3eaba')
sha256sums_i686=('bb993f682b92dd4bab883632f8d1a9298840d4e1de687fa02fff2c1f7a66b18b')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm755 "$srcdir/usr/bin/ff-pswitch-connector" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/usr/lib/mozilla/native-messaging-hosts/ax.nd.profile_switcher_ff.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
}
