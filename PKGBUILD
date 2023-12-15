# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=2.0.1
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
  '42fbbf4ae541b2a21a4090d0af1a9f8d542323688a03760e4b3745e6f7364260f176a259b60ee98a1d5c7493a7fb89a5ba9385a11bc7b6eec2fe43d89c6ba5b5'
)
md5sums=(
  '373d498d176d839127689c98701bcb27'
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
