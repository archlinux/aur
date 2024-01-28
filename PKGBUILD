# Maintainer: Alexander Shpilkin <ashpilkin at gmail dot com>
# Contributor: Sam Stuewe <halosghost at archlinux dot info>

pkgname=uacme
pkgver=1.7.5
_pkgsha=fa5e576623ea8f68249e35cdea10c900ba34d8b3 # git show-ref upstream/$pkgver
pkgrel=1
pkgdesc='An ACMEv2 client written in plain C with minimal dependencies'
arch=('i686' 'x86_64')
url='https://github.com/ndilieto/uacme/'
makedepends=('asciidoc' 'git' 'libev')
depends=('curl' 'gnutls')
optdepends=('libev: for ualpn')
license=('GPL3')
source=("$pkgname-$pkgver::git+https://github.com/ndilieto/$pkgname.git#tag=$_pkgsha?signed")
sha256sums=('SKIP')
validpgpkeys=('243828049BB5F549446516E24142E3D6318A7874') # gpg --fetch-keys https://github.com/ndilieto.gpg

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
