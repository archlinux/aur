# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr-bin
_pkgname=whatevr
pkgver=0.7.0
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (prebuilt whatevrd daemon + whatkevr Qt/Kirigami frontend)"
arch=('x86_64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-shadertools'
         'kcoreaddons' 'kdbusaddons' 'ki18n' 'kirigami' 'prison' 'qqc2-desktop-style' 'kirigami-addons'
         'rlottie' 'sqlite' 'glibc'
         'desktop-file-utils' 'shared-mime-info' 'xdg-utils')
provides=('whatevr' 'whatevrd' 'whatkevr')
conflicts=('whatevr' 'whatevr-git')
install="$_pkgname.install"
source_x86_64=("$_pkgname-$pkgver-linux-x86_64.tar.zst::$url/releases/download/v$pkgver/$_pkgname-$pkgver-linux-x86_64.tar.zst")
sha256sums_x86_64=('28a325bec249c3491643f8ffebb019b19206f4b7bacc8863d740a8a6e701b65f')

package() {
	local root="$srcdir/$_pkgname-$pkgver-linux-$CARCH"

	cp -a "$root/usr" "$pkgdir/"
	install -Dm644 "$root/usr/share/licenses/$_pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
