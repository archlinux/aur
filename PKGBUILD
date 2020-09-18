# Maintainer:
# Contributor: Michael Straube <michael.straubej@gmail.com>

pkgname=bluemindo
pkgver=1.0rc1
pkgrel=3
pkgdesc='Ergonomic and modern music player designed for audiophiles'
arch=('any')
url='https://bluemindo.codingteam.net'
license=('GPL3')
depends=('gst-python' 'python-dbus' 'python-beautifulsoup4' 'python-pytaglib' 'gtk3')
optdepends=('pulseaudio: PulseAudio support'
            'gst-plugins-good: PulseAudio support and good codecs'
            'gst-plugins-bad: additional codecs'
            'gst-plugins-ugly: additional codecs'
            'gst-libav: libav codec')
source=("https://lab.erwanbriand.fr/project/bluemindo/download/file/bluemindo-$pkgver.tar.gz"
        "bluemindo.patch")
sha256sums=('e405c881feeb43f8126988403e1c1008ee5341c8faae90d5e671d9075c89fe5c'
            '3f8758bd2255966af796937902e1ff5064df3f34283172eaee8b28d855fb0747')

prepare() {
  cd $pkgname-1.0RC1

  # patch Makefile
  patch -p1 -i ../bluemindo.patch
}

package() {
  cd $pkgname-1.0RC1

  make DESTDIR="$pkgdir" install
}
