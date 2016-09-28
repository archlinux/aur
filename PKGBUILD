# Maintainer: Omar Sandoval <osandov at osandov dot com>
# Contributor: Roger Zanoni <rogerzanoni@gmail.com>
# Contributor: Sylvain Henry <hsyl20@gmail.com>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Dan McGee <dpmcgee@gmail.com>
# Contributor: LeCrayonVert <sunrider@laposte.net>
# Contributor: Lukas Fleischer <archlinux@cryptocrack.de>
# Contributor: Vladimir Kirillov <proger@wilab.org.ua>

pkgname=coccinelle
pkgver=1.0.6
pkgrel=1
pkgdesc="Provides spatch program used to apply semantic patches"
arch=('i686' 'x86_64')
url="http://coccinelle.lip6.fr/"
license=('GPL2')
makedepends=('camlp4' 'ocaml' 'ocaml-findlib')
depends=('pcre' 'python')
optdepends=('ocaml: OCaml scripting feature'
            'ocaml-findlib: OCaml scripting feature')
options=('!strip')
source=(http://coccinelle.lip6.fr/distrib/${pkgname}-${pkgver}.tgz)
sha256sums=('8452ed265c209dae99cbb33b67bc7912e72f8bca1e24f33f1a88ba3d7985e909')

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" MANDIR="/usr/share/man" install
}

# vim:set ts=2 sw=2 et:
