# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ihor Novikov <sk1.project.org@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=uniconvertor
pkgver=2.0rc4
pkgrel=1
pkgdesc="Universal vector graphics translator using sK1 engine."
arch=(x86_64)
url="https://sk1project.net/uc2/"
license=(GPL3)
depends=(lcms2 cairo imagemagick pango python2-cairo 
         python2-pillow python2-reportlab)
source=("https://downloads.sk1project.net/uniconvertor/$pkgver/uniconvertor-$pkgver.tar.gz")
sha256sums=('98c32fa7255825cb5a395346f77bafa256d78a7b06093dbbb5f612e46371f045')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup-uc2.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup-uc2.py install --root="${pkgdir}" --optimize=1 --skip-build
}
