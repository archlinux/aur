# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Ihor Novikov <sk1.project.org@gmail.com>

pkgname=sk1
pkgver=2.0rc5
pkgrel=1
epoch=1
pkgdesc="Open source vector graphics editor for prepress"
url="https://sk1project.net/"
arch=(i686 x86_64)
license=(GPL3)
depends=(lcms2 cairo imagemagick pango python2-wxpython3 python2-cairo 
         python2-pillow python2-reportlab python2-pycups)
source=(
    #"https://downloads.sk1project.net/sk1/sk1-${pkgver}.tar.gz"
    https://sourceforge.net/projects/fabiololix-os-archive/files/src/sk1-${pkgver}.tar.gz
    )
sha256sums=('1f70dd490a62aad97118454bd18f13c3459dcbd910823835404d6b639f7ef637')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

