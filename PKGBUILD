# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=tla-tools
pkgver=2.1.3
pkgrel=1
pkgdesc="Tools for the TLA+2 language (SANY, TLC, PlusCal translator and TLATeX)"
arch=('any')
url="http://research.microsoft.com/en-us/um/people/lamport/tla/tools.html"
license=('custom:MSR-EULA')
depends=('java-runtime')
options=(!strip)
source=(
  'http://ftp.research.microsoft.com/downloads/41b4a0aa-5fad-4118-916a-45ed9fd48bf0/tla.zip'
  'pcal2tla'
  'sany'
  'tla2tex'
  'tlc'
)
sha256sums=('c8575fa589bf5e8ee8ced8cb464ab7763d6177f2994a7cf172d0997787e537a8'
            '6b807b8d022564cb1e1a2407915bcbcb8914775f8216653c98730cbf35ff7da8'
            '67001aa90cd3000e8ae00cdd064d594531d44b76f0c6141be6d3f0e85944008a'
            '9b5152e04f56ae8fe307609fd2509ea200d0b699da58a2cb9a779f7bde1c358d'
            '65959359b44562da7263e449bbeae33ede3a0a647f6044a01a0babf10ca0bd19')

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$pkgname"
  cp -a "$srcdir/tla" "$pkgdir/usr/share/java/$pkgname"
  install -D -m 0755 {pcal2tla,sany,tla2tex,tlc} "$pkgdir/usr/bin"
  install -D -m 0644 "$srcdir/tla/License.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
