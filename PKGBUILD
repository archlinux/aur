# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Arvid Norlander <anmaster A_T tele2 d_o_t (ccTLD for Sweden, which is se)>

pkgname=c-intercal
pkgver=0.29
pkgrel=2
epoch=1
pkgdesc='INTERCAL to binary (via C) compiler'
arch=('x86_64' 'i686')
url='http://overload.intercal.org.uk/c/'
license=('GPL')
depends=('gcc' 'sh')
options=('staticlibs')
source=("http://overload.intercal.org.uk/c/intercal-0.29.pax.gz")
sha256sums=('fba1678bdd058350742fad2f3f0673bcea9f4c8add761855a67d8ada6650950b')

build() {
  cd "intercal-0.29"

  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info
  make -j1
}

package() {
  cd "intercal-0.29"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
