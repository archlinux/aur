# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=mat2
pkgver=0.10.0
pkgrel=1
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://0xacab.org/jvoisin/mat2"
license=('GPL3')
makedepends=('python-setuptools' 'git')
depends=('perl-image-exiftool' 'python-mutagen' 'python-cairo' 'python-gobject' 'poppler-glib' 'gdk-pixbuf2' 'mailcap')
optdepends=('ffmpeg' 'bubblewrap')
checkdepends=('ffmpeg')
source=("git+https://0xacab.org/jvoisin/mat2.git#tag=${pkgver}?signed")
sha256sums=('SKIP')
validpgpkeys=('9FCDEE9E1A381F311EA62A7404D041E8171901CC' # Julien (jvoisin) Voisin
)
check() {
  cd "${pkgname}"
  python -m unittest discover -v
}

package() {
  cd "${pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
