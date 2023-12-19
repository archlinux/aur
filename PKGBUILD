# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=ptrack
pkgver=2.0.2
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
  '7d7912c262923ede3e0ab86b51023e6532268f145ae0e14bc6cad00c300d0e5689d42e4bd0fa167d885a30fcc93afe91885328714df7ff73ff084f98b0e88263'
)
md5sums=(
  '81298d82eae7d653a332fe3f36c45bb9'
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
