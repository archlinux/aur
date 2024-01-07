# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=2.0.3
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
  'f96d140c3d816bd192b717d4c86d4743cce58a0ad697e9f4bba363ac4e53454e6e5aceaf8b5fb2bc74ae084b69f99b17e935552d89fb4da4d146d07d764c9fff'
)
md5sums=(
  '28b2a62914d951eec70703ec57f6969f'
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
