# Maintainer: a1lu <a1lu at arcor dot de>
pkgname=qtchan
pkgver=0.1
pkgrel=1
pkgdesc="A 4chan browser written with qt5"
arch=('i686' 'x86_64')
url="https://github.com/siavash119/qtchan"
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-base')
source=("$pkgname::https://github.com/siavash119/${pkgname}/archive/v${pkgver}.zip")
md5sums=('a464d4b05664a5722e9d2e15eec3447b')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p "build"
  cd "build"
  qmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  install -Dm755 qtchan "$pkgdir/usr/bin/qtchan"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
