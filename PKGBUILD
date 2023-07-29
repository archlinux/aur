# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple CLI utility for asthetically tracking progress when copying or moving files"
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(
  "python3"
  "python-argparse"
  "python-rich"
  "python-argcomplete"
  "python-setuptools"
)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'db9699e215c260ce7a4c4865c708f65d2134428f8e088d34999e739eb7b3a4f78bfb70f267f55355c1559264f635cb37d61ee5db41af9768d987cc5c63cf2d21'
)
md5sums=(
  '5c5abd04c89624966592d03a315de4ef'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" ||
  cd "$srcdir/${pkgname}"

  python3 ./setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
