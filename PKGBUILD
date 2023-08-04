# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=0.2.1
pkgrel=1
pkgdesc="A simple CLI utility for asthetically tracking progress when copying, moving or downloading files."
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
  'ec9accc93b7ab45ae59687419f2ca3f7264eae65c13b3b64525b12dd534d654d436adbe63ce18a898b450471f59c4d6f85b1826346ca86e2151a3d0ed84a13e6'
)
md5sums=(
  '0dd8ddfbcdefa0b3e511b446bd1f1e2a'
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
  install -Dm644 ptrack.1.gz "${pkgdir}/usr/share/man1/ptrack.1.gz"

}
