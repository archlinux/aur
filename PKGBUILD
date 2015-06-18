# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Dominik George <nik@naturalnet.de>
# Contributor: quantax -- contact via Arch Linux forum or AUR

pkgname=irssi-otr
pkgver=1.0.0
pkgrel=2
pkgdesc="Off-the-Record Messaging (OTR) for the Irssi IRC client"
url="https://github.com/cryptodotis/irssi-otr"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('irssi' 'libotr' 'glib2')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/cryptodotis/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('988e50b9df430511ae21a9128ffd27ad27efc102aaa10ec59992c6e642f38dd776396a0768021e3a0588d2a8c30e6316a7b0720d31a05ac21bb47055b0d8c488')

build() {
  cd ${pkgname}-${pkgver}
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
