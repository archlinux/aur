# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=rust-bin
pkgver=1.51.0
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

sha256sums_x86_64=('9e125977aa13f012a68fdc6663629c685745091ae244f0587dd55ea4e3a3e42f'
                   'SKIP')
sha256sums_pentium4=('de2e8ef724d89ba6f567f07ebacf5a244c7cdae30ee559f1913310eda38d9cd1'
                     'SKIP')
sha256sums_i686=('de2e8ef724d89ba6f567f07ebacf5a244c7cdae30ee559f1913310eda38d9cd1'
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
