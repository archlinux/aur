# Maintainer: Milk Brewster (milkii on freenode)
_pkgname=studio-controls
pkgname=${_pkgname}-git
pkgver=2.0.9.r4.g2bdd72d
pkgrel=1
pkgdesc="An JACK audio setup utility with USB device and PulseAudio bridges."
arch=('x86_64')
url="https://github.com/ovenwerks/studio-controls"
license=('GPL')
groups=()
depends=('jack2' 'python' 'python-gobject' 'python-dbus' 'python-jack-client' 'python-pyalsaaudio' 'zita-ajbridge' 'a2jmidid')
makedepends=(git)
optdepends=('realtime-privileges: Realtime privileges for users'
        'pulseaudio-jack: PulseAudio to JACK bridge'
        'libffado: Driver for FireWire audio devices'
        'qastools: qasmixer desktop mixer application'
        'pavucontrol: PulseAudio Volume Control')
provides=('studio-controls' 'studio-controls-git')
conflicts=('studio-controls' 'studio-controls-git' 'cadence')
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/ovenwerks/studio-controls')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
cd "$srcdir/${_pkgname%}"
}

build() {
	cd "$srcdir/${_pkgname%}"
}

check() {
	cd "$srcdir/${_pkgname%}"
}

package() {
	cd "$srcdir/${_pkgname%}"
  cp -r etc usr $pkgdir
  mv $pkgdir/usr/sbin/studio-system $pkgdir/usr/bin
  rm -rf $pkgdir/usr/sbin
  # mv $pkgdir/lib $pkgdir/usr/lib

}
