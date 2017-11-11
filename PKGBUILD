# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
# Maintainer: Chrys <chrys@linux-a11y.org>

pkgname='fenrir'
pkgver=1.5.1
pkgrel=1
pkgdesc='A user space console screen reader written in python3'
arch=('any')
url="https://linux-a11y.org/index.php?page=fenrir-screenreader"
license=('LGPL')
depends=('python' 'python-pyudev' 'python-daemonize' 'python-evdev' 'python-dbus')
optdepends=('brltty: For Braille support'
'gstreamer: for soundicons via gstreamer'
  'sox: The default sound driver'
  'python-espeak: TTS support'
  'python-pyenchant: for spell check functionality'
  'xclip: for copy to X session clipboard'
  'speech-dispatcher: TTS support')
makedepends=('python-setuptools')
provides=('fenrir')
conflicts=('fenrir')
backup=('etc/fenrir/settings/settings.conf')
install="$pkgname".install
source=("https://github.com/chrys87/${pkgname}/archive/${pkgver}.tar.gz"
  'fenrir.install')
md5sums=('793241e71d56fa97f6865ac73cc8fa31'
         'e3f7651a51d3562ab314b1da3afd1ee2')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --force-settings --root="${pkgdir}/" --optimize=1
}

# vim: set ts=2 sw=2 et:
