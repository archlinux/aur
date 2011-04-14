# Maintainer: Antoine Lubineau <antoine@lubignon.info>

pkgname=tla-tools
pkgver=2
pkgrel=2
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
md5sums=(
  'c5931a7ec9426dd17795543a1d911a48'
  '389c14cadf763d5ae2b5b9719b19e5ba'
  '142d348ca24b7a7b0999d670908030a7'
  'cdb96d780f764111ec60cf67d1d158f2'
  'b89d785e2b264d0f32a69adcabb4e7d8'
)

package() {
  mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin" "$pkgdir/usr/share/licences/$pkgname"
  cp -a "$srcdir/tla" "$pkgdir/usr/share/java/$pkgname"
  install -D -m 0755 {pcal2tla,sany,tla2tex,tlc} "$pkgdir/usr/bin"
  install -D -m 0644 "$srcdir/tla/License.txt" "$pkgdir/usr/share/licences/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
