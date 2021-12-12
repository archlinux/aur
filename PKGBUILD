# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ihor Novikov <sk1.project.org@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Roberto Alsina <ralsina@kde.org>

pkgname=uniconvertor
pkgver=2.0rc5
pkgrel=1
pkgdesc="Universal vector graphics translator using sK1 engine."
arch=(x86_64)
url="https://sk1project.net/uc2/"
license=(GPL3)
depends=(lcms2 cairo imagemagick pango python2-cairo 
         python2-pillow python2-reportlab)
source=("https://downloads.sk1project.net/uc2/uniconvertor-$pkgver.tar.gz")
sha256sums=('55660b0757ee90b04c532252f98b5d95f5c6060e8bd8e1448ae50951894a3d3d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
