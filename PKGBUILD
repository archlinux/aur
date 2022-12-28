# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=most-snapshot
_pkgname=most
pkgver=5.2.0
_prever='5.2.0'
pkgrel=3
epoch=1
pkgdesc="A terminal pager similar to ‘more’ and ‘less’ (latest development snapshot)"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
depends=('slang')
license=('GPL')
url="https://www.jedsoft.org/most/"
source=("https://jedsoft.org/snapshots/${_pkgname}-${_prever}.tar.gz")
#validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis <davis@space.mit.edu>
provides=('most')
conflicts=('most')
options=('lto')
# Taken from https://jedsoft.org/snapshots/
md5sums=('9677a974b85ca60c05f2c86063316faa')

build() {
  cd "${srcdir}/${_pkgname}-${_prever}" || exit 1

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_prever}" || exit 1

  make DESTDIR="${pkgdir}" install
}

# Calculated
sha256sums=(
  'a8babadf68a7e01608340efe4d987eb954e782731232f4aa090d935068610e9f'
)
sha512sums=(
  'fea73d2c5212829a7871cd2fdde25e78a6dc865cdb9ae5d52b1a469190e2fddd2a214edf51ee942fe60d9f3346da21444858c6b70fcf55a76b725c56ed24fbd2'
)
b2sums=(
  'e26bdb7ecf85baecb50998c6c54ba0cb8ebd81ba4e6b4790c5c85f39b96ffbc109ff5735b30e1df782f2949890185d6024ffffe62ff885b8c772644ee70e0a24'
)

# eof
