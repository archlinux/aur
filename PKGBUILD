# Maintainer: superlex
# Contributor: Jorge Barroso <jorge.barroso.11@gmail.com

_debname=iceweasel
_debver=46.0.1
_debrel=1
_parrel=2
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
    sha1sums=('c94184289c3611b7921da9cf9e8a27b28a4c422e')
 else
    sha1sums=('490505b39c474315b17d4c86ba1a5117e64f3552')
 fi
 
source=("${_parrepo}/${CARCH}/${_debname}-${_parepoch}:${_debver}.deb${_debrel}-${_parrel}-${CARCH}.pkg.tar.xz")

package(){
      msg2 "Installing Iceweasel..."
      cp -r "${srcdir}"/usr "$pkgdir"/
}
 
# vim:set ts=2 sw=2 et:
