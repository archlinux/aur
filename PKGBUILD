# Maintainer: Andy Bao <contact at andybao dot me>
_appname=firefox-profile-switcher-connector
pkgname=${_appname}-bin
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.0.9
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
provides=("${_appname}")
conflicts=("${_appname}")
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
source_x86_64=("$pkgname-$pkgver-x86_64.rpm::$url/releases/download/v$pkgver/linux-x64.rpm")
source_i686=("$pkgname-$pkgver-i686.rpm::$url/releases/download/v$pkgver/linux-x86.rpm")
sha256sums_x86_64=('e01c6c01241fad43cb3dc67702373fe7579b582bd62bbbf0ede7949fd755d560')
sha256sums_i686=('711b8017ab474971893cbb7598a15b6d044199186033c5929e9036dd31e41f8e')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm755 "$srcdir/usr/bin/ff-pswitch-connector" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/usr/lib/mozilla/native-messaging-hosts/ax.nd.profile_switcher_ff.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
}
