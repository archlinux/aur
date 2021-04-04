# Maintainer: Andy Bao <contact at andybao dot me>
pkgname=firefox-profile-switcher-connector
pkgdesc="Native connector software for the 'Profile Switcher for Firefox' extension."
pkgver=0.0.4
pkgrel=1
arch=('x86_64')
url="https://github.com/null-dev/firefox-profile-switcher-connector"
license=('GPL3')
# depends=('firefox') We don't specify this as not all firefox packages provide firefox currently
source_x86_64=("$pkgname-$pkgver.rpm::$url/releases/download/v$pkgver/linux-x64.rpm")
sha256sums_x86_64=('48b3b557ad19b5ed843ab74ec9b1b99c33cce95ac7b81079b4eb6567bf2eb75e')

package() {
    mkdir -p "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm755 "$srcdir/usr/bin/ff-pswitch-connector" "$pkgdir/usr/bin/"
    install -Dm755 "$srcdir/usr/lib/mozilla/native-messaging-hosts/ax.nd.profile_switcher_ff.json" "$pkgdir/usr/lib/mozilla/native-messaging-hosts/"
}
