# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname=most-snapshot
_pkgname=most
pkgver=5.2.13
_prever='pre5.2-13'
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
  'dff130cde10f7681462e9387e2e02d2a'
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
  'b123681acdff9b337bf76fd660b121bc5b8390d3ff0be170ab4edae58ae6b88a'
)
sha512sums=(
  '62e3202650320e3b092a37b2f8ad3171499a2f629db949a0457efcca92f901fe57779e9e997a4ff2f06d3c960dde8921ff544967b83818c7bb2e635348bb0662'
)
b2sums=(
  'c783aff43b8bc31174c96ff13b528427133462b84f3311b983719bffeb3844de885f5a02ec7b6b7b003ee85c2951a9858dcaf0fe363f6dc2797e141f069d7ccf'
)

# eof
