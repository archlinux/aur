# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=rust-bin
pkgver=1.37.0
pkgrel=2
pkgdesc='Binary precompiled packages for Rust'
url='https://www.rust-lang.org/'
arch=(x86_64 pentium4 i686)
license=('MIT' 'Apache')
provides=('rust' 'cargo')
conflicts=('rust' 'cargo')
options=('!emptydirs')

source_x86_64=("https://static.rust-lang.org/dist/rust-$pkgver-x86_64-unknown-linux-gnu.tar.gz"{,.asc})
source_pentium4=("https://static.rust-lang.org/dist/rust-$pkgver-i686-unknown-linux-gnu.tar.gz"{,.asc})
source_i686=("https://static.rust-lang.org/dist/rust-$pkgver-i686-unknown-linux-gnu.tar.gz"{,.asc})

sha256sums_x86_64=('cb573229bfd32928177c3835fdeb62d52da64806b844bc1095c6225b0665a1cb'
                   'SKIP')
sha256sums_pentium4=('74510e0e52a55e65a9f716673c2cda4d2bd427e2453541c6993c77c3ec04acf9'
                     'SKIP')
sha256sums_i686=('74510e0e52a55e65a9f716673c2cda4d2bd427e2453541c6993c77c3ec04acf9'
                 'SKIP')

validpgpkeys=('108F66205EAEB0AAA8DD5E1C85AB96E6FA1BE5FE'  # Rust Language (Tag and Release Signing Key) <rust-key@rust-lang.org>
              '474E22316ABF4785A88C6E8EA2C794A986419D8A') # Tom Stellard <tstellar@redhat.com>

case "${CARCH}" in
  x86_64)               _ARCH='x86_64-unknown-linux-gnu';;
  i686|pentium4)   _ARCH='i686-unknown-linux-gnu';;
esac

package() {
  cd "rust-$pkgver-$_ARCH"

  ./install.sh --prefix=/usr --destdir="$pkgdir"
}
