# Maintainer: Bilgin COSKUN <bilgin.coskun@ceng.metu.edu.tr>
# This package is adapted from https://aur.archlinux.org/packages/openarena
# Contributor: Mark Vainomaa <mikroskeem@mikroskeem.eu>

pkgname='openarena-quake3e'
pkgver='0.8.8'
_pkgver='088'
pkgrel='1'
pkgdesc='A Community-Produced Deathmatch FPS Based on GPL idTech3 Technology (Quake3e Engine)'
arch=('x86_64' 'aarch64')
url='http://openarena.ws/'
license=('GPL')
provides=('openarena')
conflicts=('openarena')
depends=('quake3e-git')
source=(http://download.tuxfamily.org/openarena/rel/${_pkgver}/openarena-${pkgver}.zip
        'openarena'
        'openarena-server'
        'openarena.png'
        'openarena-server.png'
        'openarena.desktop'
        'openarena-server.desktop')
sha512sums=('9fa4dabe8a3428dc3cbec97f3b4d20c04569c14cdd00b60e6391c6dd61e310f246ff5ec97e7549821b3d6f5f94b140eb5411a2ddd83dafcad66937b7f78ea8dd'
            'fce7818f1b7f58dc7054939a296e7e9662274691637fbcad31b945646284e4f3783862177301e7a2b3fcac67d287eaf6ca660e78a4efb8afeefebccffdd24fca'
            '04f6727af897a0da999d69c46b64e07a0d6bee02cc5dbcfe154525a89fd48611db82abd2c7ff31ba292c124d228aeeae0baec229deaf49c122940b189707e61d'
            'ef68f8eb6251c3424464702ff894a6b88b473a3f4c1512af613125f5e5a7124f268490a9f6042095ff5bb807817e1f302c80d21987a2ed178e680f993d70b6f1'
            '9e8c860fe8e9a6fefa9839907df6e74f11564daaa2bf12b4c261dec34d65917e7110a41aa7777f16d3842c8371b9e960468d75c439d8b815454feeb8c01ed6e6'
            '5acd934f451559ad68b76a4de4b132b9ead9542dd078df7c7489ce2b2774557d81c6405622e8090ced2ace5f05165af1ed5dee8674d3fef725cd633727c92538'
            '426734a1517802b00b062006fcac4e321b4bf2fa8f3a3f7670a11ae62cf6cdd417bd158d0d613c0017e44e5a9528d72ef77e383a4fda2b230f0cc0f8ef9185d1')

build() {
  cd ${srcdir}/openarena-${pkgver}
  rm -rf *.dll *.exe
  rm -rf __MACOSX *.app
  rm -rf *.{i386,x86_64}

}

package() {
  mkdir -pvm644 $pkgdir/usr/share/{,pixmaps,applications}  $pkgdir/usr/bin/
  install -Dm 644 $srcdir/openarena{,-server}.png $pkgdir/usr/share/pixmaps/
  install -Dm 644 $srcdir/openarena{,-server}.desktop $pkgdir/usr/share/applications/
  install -Dm 755 $srcdir/openarena{,-server} $pkgdir/usr/bin/
  cp -rv --no-preserve=mode,ownership $srcdir/openarena-${pkgver} $pkgdir/usr/share/openarena
}
