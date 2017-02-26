# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=python-pogoprotos
pkgver=2.7.0
pkgrel=1
pkgdesc='Python proto files for PokémonGO'
arch=('any')
url='https://github.com/AeonLucid/POGOProtos'
license=('MIT')
depends=('python')
source=("python-pogoprotos-${pkgver}.tar.gz::https://github.com/AeonLucid/POGOProtos/archive/v${pkgver}.tar.gz")
sha256sums=('e7ad107649eb4ced15cc23c13c17a440a936ebd267d4894f4ccc8822156e1295')


build() {
  cd POGOProtos-${pkgver}

  python compile_single.py -l python
}
package() {
  cd POGOProtos-${pkgver}

  _pylibdir=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")

  install -dm 755 "${pkgdir}"${_pylibdir}
  cp -dr --no-preserve='ownership' out/POGOProtos "${pkgdir}"${_pylibdir}/
}

# vim: ts=2 sw=2 et:
