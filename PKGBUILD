# Maintainer: Chris Harvey <chris@chrisnharvey.com>

pkgname=thunderbird-ubuntu-bin
_pkgname=thunderbird
pkgver=68.8.0
pkgrel=1
_ubuntuver="$pkgver+build2-0ubuntu0.20.04.2_amd64"
pkgdesc="Standalone mail and news reader from mozilla.org Ubuntu patches (binary)"
arch=("x86_64")
url="https://www.thunderbird.net/"
license=(MPL GPL LGPL)
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         nss hunspell sqlite ttf-font icu)  # libvpx
optdepends=('libcanberra: sound support')
provides=('thunderbird' 'thunderbird-ubuntu')
conflicts=('thunderbird' 'thunderbird-ubuntu')

source=("http://ppa.launchpad.net/ubuntu-mozilla-security/ppa/ubuntu/pool/main/t/thunderbird/thunderbird_$_ubuntuver.deb")
sha256sums=('177207ae0ac4869d50295e8eb6a2ede9844ec6e3f3e1f9485a4a9dce95ee7ac0')

prepare() {
	# Don't extract copyright files, which are included in the licenses package
	tar -xvf data.tar.xz --exclude=usr/share/doc
}

package() {
	cp -r etc "$pkgdir/"
	cp -r usr "$pkgdir/"
}

