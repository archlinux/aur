# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>

pkgname=qoob-git
pkgver=0.2.1.r0.g2e3ed22
pkgrel=1
pkgdesc="foobar-like music player for Linux"
url="https://gitlab.com/william.belanger/${pkgname%-git}"
arch=("any")
license=("GPL3")
depends=(python python-setuptools python-pyqt5 qt5-svg qt5-multimedia python-mutagen gst-plugins-base gst-plugins-good)
optdepends=('python-xlib: media keys support'
            'gst-libav: additional codecs (i.e. AAC)'
            'gst-plugins-bad: additional codecs (i.e. AAC)'
            'gst-plugins-ugly: additional codecs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.com/william.belanger/${pkgname%-git}.git")
sha256sums=("SKIP")

pkgver()
{
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${pkgname%-git}"
  python setup.py build
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
