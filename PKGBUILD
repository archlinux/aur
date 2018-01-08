# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=id3
pkgver=0.80
pkgrel=1
pkgdesc="Utility to edit id3v1 and id3v2 tags"
arch=('x86_64')
url="https://squell.github.io/id3/"
license=('BSD')
depends=('gcc-libs')
options=('!makeflags')
source=("https://github.com/squell/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('9eb2bca6ec194f0b6a56d91c7f433dd5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man" install

  #install license
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
