# Maintainer: Oden S. <hello [at] odensc [dot] me>
pkgname=yubioath-krunner
pkgver=2.0.0
pkgrel=1
pkgdesc="Displays your YubiKey OATH credentials in krunner when you search for them."
arch=("any")
url="https://github.com/odensc/yubioath-krunner"
license=("LGPL")
depends=("python" "python-configargparse" "python-dbus" "python-fuzzywuzzy" "python-levenshtein" "python-gobject" "libnotify" "yubikey-manager" "xclip" "xdotool")
install=$pkgname.install
source=("https://github.com/odensc/yubioath-krunner/archive/v${pkgver}.tar.gz")
# update with updpkgsums
md5sums=('02d2fa1bc52dfa6eb62ef8af983fd6e7')

package() {
	cd yubioath-krunner-$pkgver
	mkdir -p $pkgdir/etc/yubioath-krunner
	mkdir -p $pkgdir/usr/share/kservices5
	cp yubioath-krunner.config $pkgdir/etc/yubioath-krunner/config
	cp yubioath-krunner.desktop $pkgdir/usr/share/kservices5
	cp yubioath-krunner.py $pkgdir/usr/share/kservices5
}
