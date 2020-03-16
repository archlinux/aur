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
pkgver=68.6.0
_pkgrel=1
pkgrel=${_pkgrel}
pkgdesc="Thunderbird-appmenu, binary version"
arch=('x86_64')
license=('MPL' 'GPL' 'LGPL')
url="https://aur.archlinux.org/packages/thunderbird-appmenu/"
depends=(gtk3 mozilla-common libxt startup-notification mime-types dbus-glib alsa-lib
         nss hunspell sqlite ttf-font icu)  # libvpx
makedepends=(unzip zip diffutils python python2 yasm nasm mesa imake libpulse inetutils xorg-server-xvfb
             autoconf2.13 rust clang llvm gtk2 cbindgen nodejs)
optdepends=('libcanberra: sound support')
provides=("thunderbird=$pkgver")
conflicts=("thunderbird")
options=(!emptydirs !makeflags)
source=(https://github.com/nikatar/AUR/raw/master/thunderbird-appmenu-bin/thunderbird-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz{,.sig})
noextract=(thunderbird-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz)
validpgpkeys=(85F86E317555BECC1C2184BF2C45BA09ABC5D7DA)
sha256sums=(
	'62711f19fe4f557c1878f3b7aa165c69b6d815aa517d6201704dc34be7f9218f'
	'SKIP'
)

package() {
	tar -xf $srcdir/thunderbird-appmenu-${pkgver}-${_pkgrel}-x86_64.pkg.tar.xz -C $pkgdir --exclude=".*"
}
