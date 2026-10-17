# Render only from a verified release, using tools/build_release.py.
pkgname=lsi-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Image thumbnail listing in Kitty-compatible terminals (standalone binary)'
arch=('x86_64')
url='https://github.com/serber-info/kitty-lsi'
license=('MIT' 'Apache-2.0' 'BSD-2-Clause' 'BSD-3-Clause' 'MPL-2.0' 'Unicode-3.0' 'Zlib' '0BSD' 'CC0-1.0' 'Unlicense' 'ISC' 'NCSA' 'Apache-2.0 WITH LLVM-exception')
provides=("lsi=$pkgver")
conflicts=('lsi')
options=('!strip' '!debug')
source=("https://github.com/serber-info/kitty-lsi/releases/download/v${pkgver}/lsi-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('3eae87bd6bda1722e64bb91f1071a4ec4c86aba31676002274de7a62af0e5d97')
package() {
  install -Dm755 lsi "$pkgdir/usr/bin/lsi"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/lsi/README.md"
  install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/lsi/SECURITY.md"
  install -Dm644 RUNTIME-NOTICES.md "$pkgdir/usr/share/doc/lsi/RUNTIME-NOTICES.md"
  install -Dm644 THIRD_PARTY.md "$pkgdir/usr/share/doc/lsi/THIRD_PARTY.md"
  install -Dm644 PROVENANCE.json "$pkgdir/usr/share/doc/lsi/PROVENANCE.json"
  install -Dm644 dependencies.json "$pkgdir/usr/share/doc/lsi/dependencies.json"
  cp -r licenses "$pkgdir/usr/share/licenses/$pkgname/"
  cp -r mpl-source "$pkgdir/usr/share/doc/lsi/"
}
