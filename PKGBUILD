# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=jorgan
pkgver=3.21_beta1
pkgrel=1
epoch=
pkgdesc="Java-based MIDI processor intended for pipe organ emulation"
arch=('any')
url="http://jorgan-home.de/"
license=('GPL3')
groups=()
depends=('java-runtime' 'alsa-lib' )
makedepends=('unzip')
checkdepends=()
optdepends=('jack-audio-connection-kit: low-latency audio server'
'fluidsynth: soundfont playing' )
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://downloads.sourceforge.net/project/jorgan/jorgan/3.21/jorgan-3.21-beta1.zip"
"jorgan.desktop")
noextract=("jorgan-3.21-beta1.zip")
md5sums=('be8db4257fd3152869b2393516a37773'
	'c3e12491aadf07b526fc8ad6ed8a69ad')
validpgpkeys=()

prepare() {
	unzip -d $srcdir jorgan-3.21-beta1.zip
}

package() {
	mkdir $pkgdir/usr $pkgdir/usr/share $pkgdir/usr/share/jorgan $pkgdir/usr/share/applications
	cp -R $srcdir/* $pkgdir/usr/share/jorgan/
	cp $srcdir/jorgan.desktop $pkgdir/usr/share/applications/
}
