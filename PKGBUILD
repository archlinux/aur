### Original Thunderbird from extra ###
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Anders Bostrom <anders.bostrom@home.se>

### Appmenu patching ###
# PKGBUILD: Nikita Tarasov <nikatar@disroot.org>
# Building: Nikita Tarasov <nikatar@disroot.org>

pkgname=thunderbird-appmenu-bin
pkgver=68.11.0
_pkgrel=1
pkgrel=${_pkgrel}
pkgdesc="Thunderbird-appmenu, binary version"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://aur.archlinux.org/packages/thunderbird-appmenu/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         nss hunspell sqlite ttf-font icu)  # libvpx
optdepends=('libcanberra: sound support')
provides=("thunderbird=$pkgver")
conflicts=("thunderbird")
options=(!emptydirs !makeflags)
source=(https://github.com/nikatar/AUR/raw/master/thunderbird-appmenu-bin/thunderbird-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst{,.sig})
noextract=(thunderbird-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst)
validpgpkeys=(85F86E317555BECC1C2184BF2C45BA09ABC5D7DA)
sha256sums=(
	'1aa64acff22e874f5c28a5d41d75f356778d1ab22d22974a0121a226d0f8f08e'
	'SKIP'
)

package() {
	tar -xf $srcdir/thunderbird-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.zst -C $pkgdir --exclude=".*"
}
