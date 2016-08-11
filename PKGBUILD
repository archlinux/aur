# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=talking-clock
pkgname=talking-clock-git
pkgver=v15.0.r5.3b6827e
pkgrel=1
pkgdesc="Highly configurable clock written in bash with soundpack and voice options."
arch=('any')
url="https://notabug.org/stormdragon2976/$_pkgname"
license=('WTFPL')
depends=('bash')
makedepends=('git')
optdepends=('espeak: TTS support'
	'festival: TTS support'
	'flite: TTS support'
	'translate-shell: TTS support'
	'speech-dispatcher: TTS support'
	'svox-pico-git: TTS support'
	'pulseaudio: Chime sound support'
	'sox: Chime sound support'
	'vorbis-tools: Chime sound support'
	'torsocks: Get temperature information anonymously using torify'
'yad: for talking-clock-gui to work')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
md5sums=("SKIP")

pkgver()
{
  cd "${_pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
} 

package()
 {
  cd "$_pkgname"
  install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/usr/share/talking-clock"
  install -m755 "src/talking-clock" "$pkgdir/usr/bin"
  install -m755 "talking-clock-gui/talking-clock-gui" "$pkgdir/usr/bin"
  install -m666 "README.md" "$pkgdir/usr/share/talking-clock"
  install -m666 "src/bell.ogg" "$pkgdir/usr/share/talking-clock"
  install -m666 "src/prepend.ogg" "$pkgdir/usr/share/talking-clock"
  install -m666 "src/15.ogg" "$pkgdir/usr/share/talking-clock"
  install -m666 "src/30.ogg" "$pkgdir/usr/share/talking-clock"
  install -m666 "src/45.ogg" "$pkgdir/usr/share/talking-clock"
  }

# vim:set ts=2 sw=2 et:
