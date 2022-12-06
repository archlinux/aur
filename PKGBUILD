# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Tino Reichardt <milky-archlinux@mcmilk.de>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=mcdp
pkgver=0.4
pkgrel=2
pkgdesc="Small console cd player"
arch=('x86_64')
url="https://www.mcmilk.de/projects/mcdp/"
license=('GPL')
depends=('glibc')
#makedepends=('dietlibc')
source=(https://deb.debian.org/debian/pool/main/m/mcdp/mcdp_${pkgver}.orig.tar.gz)
sha512sums=('580743c67e628871b69ddffc49fa796a7dc6ee7943e1e697a0e2a7f60baa22bab02475a7b693c8f827f337f4fb2b7d948c048e47f9333926c2ef0a37d5489fe0')

build() {
  cd ${pkgname}-${pkgver}
  make ${pkgname}
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 ${pkgname} "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 ${pkgname}.1 "${pkgdir}"/usr/share/man/man1/${pkgname}.1
}
