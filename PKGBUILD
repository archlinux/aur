# Maintainer: neeshy <neeshy@tfwno.gf>
pkgname=webm
pkgver=0.12.1
pkgrel=1
pkgdesc="Cross-platform command-line WebM converter"
arch=('any')
url="https://github.com/Kagami/webm.py"
license=('custom:CC0')
depends=('python' 'ffmpeg')
optdepends=('mpv: for interactive mode')
makedepends=('python-setuptools')
source=("https://github.com/Kagami/webm.py/archive/v$pkgver.tar.gz")
sha256sums=('786244edc928583a49e210cbb5533d192bf9ad31bc82eb0a66d393964db119c8')

build() {
  cd "$srcdir/webm.py-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/webm.py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
