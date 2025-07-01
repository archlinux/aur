# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=nullshell
pkgver=0.0.8
pkgrel=1
pkgdesc='do nothing but print keep alive characters, can be used for login shell'
arch=('x86_64')
makedepends=('discount')
url='https://github.com/eworm-de/nullshell'
conflicts=('nullshell-git')
license=('GPL-3.0-or-later')
install=nullshell.install
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183')
source=("https://www.eworm.de/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.asc})
sha256sums=('bc38dced05acf3dafc58b75d9bf1f8a27abed2beb1543b8b2d39b820041357f1'
            'SKIP')

build() {
  cd ${pkgname}-${pkgver}/

  make
}

package() {
  cd ${pkgname}-${pkgver}/

  make DESTDIR="${pkgdir}" install
}

