# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@protonmail.com>
_mirror=http://mirror.ufam.edu.br/manjaro/
pkgname=firefox-kde-manjaro
pkgver=64.0
pkgrel=1
pkgdesc="Standalone web browser from mozilla.org with OpenSUSE patch, \
integrate better with KDE from Manjaro repos"
arch=('x86_64')
license=('GPL' 'MPL' 'LGPL')
url="https://build.opensuse.org/package/show/mozilla:Factory/MozillaFirefox"
depends=(
		'mozilla-common' 'libxt' 'startup-notification' 'mime-types'
		'dbus-glib' 'hicolor-icon-theme' 'libvpx' 'icu'  'libevent'
		'nss>=3.28.3' 'nspr>=4.10.6' 'hunspell' 'sqlite' 'libnotify'
		'kmozillahelper' 'ffmpeg' 'gtk3')
optdepends=(
		'networkmanager: Location detection via available WiFi networks'
		'speech-dispatcher: Text-to-Speech')
provides=("firefox=${pkgver}")
conflicts=('firefox' 'firefox-kde-opensuse')
#options=('!emptydirs' 'debug' 'strip')

source=(${_mirror}stable/community/${arch}/firefox-kde-opensuse-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz{,.sig})
validpgpkeys=('E4CDFE50A2DA85D58C8A8C70CAA6A59611C7F07E')
noextract=("firefox-kde-opensuse-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
md5sums=('ed4947df3fec01d624cd93709d74cff7'
         'SKIP')

package() {
  tar -xf "$srcdir/firefox-kde-opensuse-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz" -C $pkgdir --exclude=".*"
}
