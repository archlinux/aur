# Maintainer: Maxim Polishchuck <mpolishchuck[at]gmail[dot]com>
_pkgname=ovito
pkgname=ovito-opt
pkgver=2.9.0
pkgrel=1
pkgdesc="A scientific visualization and analysis software for atomistic simulation data."
url="http://www.ovito.org"
arch=('x86_64')
license=('GPL3')
depends=('python' 'qt5-svg' 'ffmpeg2.8')
conflicts=('ovito' 'ovito-git')
md5sums=(
    '65f8eb93e96145c556e9b04499f924b0'
    '2b86c33c121e442ee443168e6414cc2f'
    'a7e384fcc9ed17cf85205945336a5f49'
)
source=(
    "http://www.ovito.org/download/$pkgver/${_pkgname}-$pkgver-$CARCH.tar.gz"
    'launcher-ovito.sh'
    'launcher-ovitos.sh'
)

package() {
  cd ${_pkgname}-${pkgver}-$CARCH
  install -d ${pkgdir}/opt/ovito
  cp -dpr --no-preserve=ownership ./* ${pkgdir}/opt/ovito

  install -Dm755 ${srcdir}/launcher-ovito.sh ${pkgdir}/usr/bin/ovito
  install -Dm755 ${srcdir}/launcher-ovitos.sh ${pkgdir}/usr/bin/ovitos
}
