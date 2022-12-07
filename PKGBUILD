# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=mcdp
pkgver=0.4
_pkgver=b
pkgrel=3
pkgdesc="Small console cd player"
arch=('x86_64' 'aarch64')
url="https://www.mcmilk.de/projects/mcdp/"
license=('GPL')
depends=('glibc')
#makedepends=('dietlibc')
source=("https://mcmilk.de/projects/mcdp/dl/mcdp-${pkgver}${_pkgver}.tar.bz2")
sha512sums=('af7042794ed36c1cfdfbf8ad3299ca377942c67f3eaaf0778ef368e29288945331f753dfdd320e667f499c8229cf770dc8d6149ef6214d76b7eaceff54203b6d')

build() {
  cd ${pkgname}-${pkgver}${_pkgver}
  make ${pkgname}
}

package() {
  cd ${pkgname}-${pkgver}${_pkgver}

  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
}
