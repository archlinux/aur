# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=most-snapshot
_pkgname=most
pkgver=5.2.11
_prever='pre5.2-11'
pkgrel=1
pkgdesc="A terminal pager similar to ‘more’ and ‘less’ (latest development snapshot)"
arch=('x86_64' 'armv7h')
depends=('slang')
license=('GPL')
url="https://www.jedsoft.org/most/"
source=("https://jedsoft.org/snapshots/${_pkgname}-${_prever}.tar.gz")
#validpgpkeys=('AE962A02D29BFE4A4BB2805FDE401E0D5873000A')  # John E. Davis <davis@space.mit.edu>
provides=('most')
conflicts=('most')
md5sums=(
  'e2e695c4fe87425b769f831f1f272187'
)

build() {
  cd "${srcdir}/${_pkgname}-${_prever}" || exit 1

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${_prever}" || exit 1

  make DESTDIR="${pkgdir}" install
}

sha256sums=(
  '3b71cded1444a25e90e6ba8c8ff5302a89e70a99dffb2080a1a0c49c8c13961a'
)
sha512sums=(
  '3b7d93b915c1114e19c59cc1495ad23e514688e596dee40cf6573fef88fd69e9dba3944993aed4a722c017555bd0b3239bab56971e34f1419df53e8d8baa85ce'
)
b2sums=(
  'bc825852670d8811aa037bfb7b63dfb0d4d58e755e72d06d16414dbee6be1686cf0cdd1b851c3e29bb515a3deb8e407caa3c2a2fa3cfa5d9bef43dc5940186b7'
)

# eof
