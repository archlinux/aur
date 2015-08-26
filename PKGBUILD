# Maintainer: Sebastian Wolf <swolf at melonkru dot de>
pkgname=pysize
pkgver=0.2
pkgrel=1
pkgdesc="A graphical and console tool for exploring the size of directories"
arch=('any')
license=('GPL')
depends=('python2')
optdepends=('pygtk: GTK+ GUI')
url="http://guichaz.free.fr/pysize/"
source=("http://guichaz.free.fr/${pkgname}/files/${pkgname}-${pkgver}.tar.bz2")
md5sums=('e25fea5169b12e49f732f29a3de30d80')

package() {
  mkdir -p ${pkgdir}/usr/lib/ || return 1
  mkdir -p ${pkgdir}/usr/bin/ || return 1

  cd "${srcdir}/${pkgname}-${pkgver}"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/python2|" ${pkgname}.py

  cp -R pysize ${pkgdir}/usr/lib/ || return 1
  install -Dm755 ${pkgname}.py "${pkgdir}/usr/lib/${pkgname}.py"

  ln -s "/usr/lib/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
