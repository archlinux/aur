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
  '9fa260b1e62b568913a510f75f04de5fc7e9fcae99de65e1c3f7b07748ab5725ad2de35d2cf00b5f6b4eebf52a7d8fec6caf44353cfc063aee61099cd0e7fa29'
)
md5sums=(
  '465b4b19859a8a3bfe041afe147ca374'
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
