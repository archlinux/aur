# Maintainer: Omar Sandoval <osandov at cs dot washington dot edu>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.0.0
pkgrel=1
pkgdesc="Provides spatch program used to apply semantic patches"
arch=('i686' 'x86_64')
url="http://coccinelle.lip6.fr/"
license=('GPL2')
makedepends=('camlp4' 'ocaml' 'ocaml-findlib')
depends=('pcre' 'python')
optdepends=('ocaml: OCaml scripting feature'
            'ocaml-findlib: OCaml scripting feature')
options=(!strip)
source=(http://coccinelle.lip6.fr/distrib/${pkgname}-${pkgver}.tgz)
sha256sums=('e18b4c77964c6f623c385dc8b2fcb46beacd9811927617144620b12d93289e74')

build() {
   cd "$pkgname-$pkgver"

   ./configure --prefix=/usr
   make
}

package() {
   cd "$pkgname-$pkgver"

   make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" install
}
