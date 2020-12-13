# Maintainer: William Belanger <echo d2lsbGlhbS5iZWxyQGdtYWlsLmNvbQ== | base64 -d>

pkgname=qoob-git
pkgver=r166.2e3ed22
pkgrel=1
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="foobar-like music player for Linux"
url="https://gitlab.com/william.belanger/${pkgname%-git}"
arch=("any")
license=("GPL3")
depends=("python" "python-setuptools" "python-pyqt5" "qt5-svg" "qt5-multimedia" "python-mutagen" "gst-plugins-base" "gst-plugins-good")
optdepends=("python-xlib: media keys support"
            "gst-plugins-bad: additional codecs"
            "gst-plugins-ugly: additional codecs"
            "gst-libav: additional codecs")

source=("git+https://gitlab.com/william.belanger/${pkgname%-git}.git")
md5sums=("SKIP")

pkgver()
{
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package()
{
  cd "${pkgname%-git}"
  python setup.py install --optimize="1" --root="$pkgdir"
}
