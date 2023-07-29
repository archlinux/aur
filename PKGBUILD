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
  '136da6c67bdd956335d9354bffc8db6428f773bee1808cf675d5caaa71d03f392abe187917e98ec18ffac9def7f105aa39d14f4a0a1539d69a0a4546aba6baed'
)
md5sums=(
  '386a0c102849b2ea8b09759b1b40e007'
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
