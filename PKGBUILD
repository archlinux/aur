# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple CLI utility for asthetically tracking progress when copying, moving or downloading files."
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=("python3")
source=(
  "https://software.concise.cc/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.xz"
)
sha512sums=(
  'f720ef2c1ff8378e4504d10de14cf2c9f6c5ffe577ea8ca39fcae76e803f3682f5b46b224a96c194f62d8434a27ff703482384ed760216c9c5dc33f664c2953f'
)
md5sums=(
  'f7cba42bf97ab69070e3673ff68a8e2c'
)
validpgpkeys=(
  '81BACEEBC3EA26E127166E4A819BB92A9A48160E'
)

package() {

  cd "$srcdir/${pkgname}-${pkgver}-${pkgrel}-${arch}" 2>/dev/null ||
  cd "$srcdir/${pkgname}" 2>/dev/null

  pip3 install --user --upgrade --force-reinstall --no-deps  ${pkgname}

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 ptrack.1.gz "${pkgdir}/usr/share/man1/ptrack.1.gz"

}
