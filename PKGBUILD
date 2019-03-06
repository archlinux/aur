# Contributor: Francois Boulogne <devel at sciunto dot org>
# Maintainer: Francois Boulogne <devel at sciunto dot org>

pkgname=mat2
pkgver=0.8.0
pkgrel=2
pkgdesc="Metadata anonymisation toolkit"
arch=('any')
url="https://0xacab.org/jvoisin/mat2"
license=('GPL3')
makedepends=('python-setuptools' 'git')
depends=('python' 'perl' 'perl-image-exiftool' 'python-mutagen' 'python-cairo' 'python-gobject' 'poppler-glib')
optdepends=('ffmpeg' 'bubblewrap')
source=("git+https://0xacab.org/jvoisin/mat2.git#tag=${pkgver}?signed")
sha256sums=('SKIP')
validpgpkeys=('9FCDEE9E1A381F311EA62A7404D041E8171901CC' # Julien (jvoisin) Voisin
             )

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:ts=2:sw=2:et:
