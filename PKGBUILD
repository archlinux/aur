# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=0.1.4
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
  '4adf8855c41f9281b85e927aafd73dd551bf1b01f18c737a1e81ef6d9a7de597315525c1cb88320be17072cf0d584ace28e1f1bcb68c36b0929968ee59fc7757'
)
md5sums=(
  '25c0afe0fead2ce218f2f8784feb0e3f'
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
