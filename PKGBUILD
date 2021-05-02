# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=firefox-profile-switcher-connector-bin
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.0.6
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
source_x86_64=("$pkgname-$pkgver-x86_64.rpm::$url/releases/download/v$pkgver/linux-x64.rpm")
source_i686=("$pkgname-$pkgver-i686.rpm::$url/releases/download/v$pkgver/linux-x86.rpm")
sha256sums_x86_64=('a6c9cf67a30645464fb607e637966c5771321d1d2167dfd31d240d9c390505fe')
sha256sums_i686=('c85eb16096f7adb5604525560c6edb0750ba15cb8cf2f9ef7e25df995f8432ce')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm755 "$srcdir/usr/bin/ff-pswitch-connector" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/usr/lib/mozilla/native-messaging-hosts/ax.nd.profile_switcher_ff.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
}
