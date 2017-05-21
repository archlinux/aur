pkgname=kalliope
pkgver=0.4.4
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
depends=(portaudio python-speechrecognition python-markupsafe python-pyaudio python-pythondialog python-jinja  python-cffi python-flask-restful python-ipaddress python-apscheduler python-flask-testing python-httpretty python-requests svox-pico-bin mplayer python-feedparser python-mock python-transitions python-gitpython python-pyalsaaudio python-rpi.gpio python-soundfile python-sounddevice)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('1be82572e6562a89a508da4c7b786951779798a40f57b123b3b1f8aecdaf86ee')

build()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py build
}

package()
{
  cd "$srcdir/kalliope-${pkgver}"
  python setup.py install --root=${pkgdir} --optimize=1
}
