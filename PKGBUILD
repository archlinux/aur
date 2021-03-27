# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=rust-bin
pkgver=1.50.0
pkgrel=1
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

sha256sums_x86_64=('fa889b53918980aea2dea42bfae4e858dcb2104c6fdca6e4fe359f3a49767701'
                   'SKIP')
sha256sums_pentium4=('dee56dc425ed5d8e8112f26fba3060fd324c49f1261e0b7e8e29f7d9b852b09a'
                     'SKIP')
sha256sums_i686=('dee56dc425ed5d8e8112f26fba3060fd324c49f1261e0b7e8e29f7d9b852b09a'
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
