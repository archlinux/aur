# Maintainer: Lucas Saliés Brum <sistematico@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=id3
pkgver=0.81
pkgrel=1
pkgdesc="Utility to edit id3v1 and id3v2 tags"
arch=('x86_64')
url="https://squell.github.io/id3/"
license=('BSD')
depends=('gcc-libs')
options=('!makeflags')
source=("https://github.com/squell/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7860110b46cba9706dd25084cc086dd1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make prefix="${pkgdir}/usr" mandir="${pkgdir}/usr/share/man" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
