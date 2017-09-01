pkgname=kalliope
pkgver=0.4.5
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Modular always-on voice controlled personal assistant designed for home automation"
depends=(portaudio python-speechrecognition python-markupsafe python-pyaudio python-pythondialog python-jinja  python-cffi python-flask-restful python-ipaddress python-apscheduler python-flask-testing python-httpretty python-requests svox-pico-bin mplayer python-feedparser python-mock python-transitions python-gitpython python-pyalsaaudio python-rpi.gpio python-soundfile python-sounddevice python-sox)
license=('MIT')
url="https://github.com/kalliope-project/kalliope"
source=("https://github.com/kalliope-project/kalliope/archive/v${pkgver}.tar.gz")
sha256sums=('8931e1ff865f2cd926183818c5a20d603d9c3cc222f1c1c3f8c72e6b3bbfee75')


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
