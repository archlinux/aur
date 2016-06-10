# Maintainer: superlex
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com

_debname=iceweasel
_debver=47.0
_debrel=1
_parrel=1
_parepoch=1
_parrepo=https://repo.parabola.nu/libre/os
 
pkgname=iceweasel-bin
pkgver=${_debver}.deb${_debrel}.par${_parrel}
pkgrel=1
pkgdesc="A libre version of Debian Iceweasel (Parabola GNU/Linux-libre bin version)"
arch=('i686' 'x86_64')
url="https://wiki.parabola.nu/iceweasel"
license=(MPL GPL LGPL)
conflicts=("$_debname")
provides=("$_debname"="$_debver")

depends=(alsa-lib dbus-glib ffmpeg gtk2 gtk3 hunspell icu=57.1 libevent libvpx=1.5.0 libxt mime-types mozilla-common nss sqlite startup-notification ttf-font)

optdepends=('networkmanager: Location detection via available WiFi networks'
			      'upower: Battery API'
			      'ffmpeg: H264/AAC/MP3 decoding'
            'iceweasel-extension-archsearch: Iceweasel Arch search engines')

install=iceweasel.install
 
 if [ "$CARCH" = "x86_64" ]; then
    sha1sums=('3c6a0b4a1f6bf799d12c409d0aefebaa2c860664')
 else
    sha1sums=('43d32ea6223e4894dc26a4dfe42f11929c7c0dc1')
 fi
 
source=("${_parrepo}/${CARCH}/${_debname}-${_parepoch}:${_debver}.deb${_debrel}-${_parrel}-${CARCH}.pkg.tar.xz")

package(){
      msg2 "Installing Iceweasel..."
      cp -r "${srcdir}"/usr "$pkgdir"/
}
 
# vim:set ts=2 sw=2 et:
