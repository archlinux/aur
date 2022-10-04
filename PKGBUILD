# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=qoob
pkgver=0.2.1
pkgrel=2
pkgdesc="foobar-like music player for Linux"
url="https://gitlab.com/william.belanger/qoob"
arch=("any")
license=("GPL3")
depends=(python python-setuptools python-pyqt5 qt5-svg qt5-multimedia python-mutagen gst-plugins-base gst-plugins-good)
optdepends=('python-xlib: media keys support'
            'gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
source=("https://gitlab.com/william.belanger/qoob/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('d03569634c2843ccdd1e953ecd78459533b15caa8dfd5e2fcf626ef04757f54f')

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
