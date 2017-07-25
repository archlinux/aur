# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
# Maintainer: Chrys <mail@chrys.de>

_gitname='fenrir'
pkgname="${_gitname}-git"
pkgver=v0.2.690.g8878a2a
pkgrel=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://linux-a11y.org/index.php?page=fenrir-screenreader"
license=('LGPL')
depends=('python' 'python-daemonize' 'python-evdev' 'python-dbus')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyenchant: for spell check functionality'
  'speech-dispatcher: TTS support')
makedepends=('git')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrir/settings/settings.conf')
install="$pkgname".install
source=("git+https://github.com/chrys87/${_gitname}.git"
  'fenrir-git.install')
md5sums=('SKIP'
         'e3f7651a51d3562ab314b1da3afd1ee2')

pkgver()
{
  cd "$srcdir/$_gitname"
  local ver="$(git describe --tags)"
  echo "${ver//-/.}"
}

package()
{
  cd "$srcdir/$_gitname"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
