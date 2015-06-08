# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
_pkgname=talking-clock
pkgname=talking-clock-git
pkgver=15
pkgrel=1
pkgdesc="Highly configurable clock written in bash with soundpack and voice options."
arch=('any')
url="http://github.com/stormdragon2976/talking-clock"
license=('WTFPL')
depends=('bash')
makedepends=('git')
optdepends=('espeak: TTS support'
	'festival: TTS support'
	'speech-dispatcher: TTS support'
	'svox-pico-git: TTS support'
	'pulseaudio: Chime sound support'
	'sox: Chime sound support'
	'vorbis-tools: Chime sound support'
	'torsocks: Get temperature information anonymously using torify'
'yad: for talking-clock-gui to work')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+git://github.com/stormdragon2976/talking-clock.git")
md5sums=("SKIP")

pkgver()
{
  cd "$_pkgname"
  git shortlog | head -n 1 | tr -Cd "[:digit:]"
}
 
package()
 {
  cd "$_pkgname"
  install -d "$pkgdir/usr/bin"
 install -d "$pkgdir/usr/share/talking-clock"
  install -m755 "src/talking-clock" "$pkgdir/usr/bin"
  install -m755 "talking-clock-gui/talking-clock-gui" "$pkgdir/usr/bin"
  install -m666 "README" "$pkgdir/usr/share/talking-clock"
  install -m666 "src/bell.ogg" "$pkgdir/usr/share/talking-clock"
  }

# vim:set ts=2 sw=2 et:
