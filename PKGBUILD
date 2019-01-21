# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer:  Achilleas Pipinellis <axilleas archlinux gr>

pkgname=supermin
pkgver=5.1.20
pkgrel=1
pkgdesc="Tool for creating supermin appliances"
arch=('i686' 'x86_64')
url="http://people.redhat.com/~rjones/supermin/"
license=('GPL')
makedepends=('ocaml' 'ocaml-findlib' 'cpio')
depends=('e2fsprogs')
# Does not provide febootstrap because supermin is not compatible with it
provides=()
conflicts=('febootstrap<=3.21' 'supermin-git')
source=("http://libguestfs.org/download/supermin/supermin-${pkgver}.tar.gz")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}

sha512sums=('ccc9ada98593f91399b323f0beb027185874f82547a1df4274c1206a9b6d4465e98b7aef5618274d41fb902747f6843fd2cc6192a4ea8526811261ac5a16848e')
