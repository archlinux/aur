# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=qoob
pkgver=0.2.1
pkgrel=1
pkgdesc="foobar-like music player for Linux"
url="https://gitlab.com/william.belanger/qoob"
arch=("any")
license=("GPL3")
depends=(python python-setuptools python-pyqt5 qt5-svg qt5-multimedia python-mutagen gst-plugins-base gst-plugins-good)
optdepends=('gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
source=("https://gitlab.com/william.belanger/qoob/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('165936720404a3e2afc5382b83f6ce293e1c5e38a657f7ea72cfeb9a4a7d2779')

build()
{
  cd "${pkgname}-v${pkgver}"
  python setup.py build
}

package()
{
  cd "${pkgname}-v${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
