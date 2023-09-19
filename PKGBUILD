# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=1.0.0
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
  '5187800feee1f5ae99aa4320d4185ea98d8c087247ce2ee1b0d200db5f1ec438d4508f968471315a66c53d2c556f89395a7f03d1431fd181956a38af061dc4ab'
)
md5sums=(
  'a91fe5517ddbb44ff86af55108012df3'
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
