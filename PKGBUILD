# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.3.0
pkgrel=1
pkgdesc="A music production session manager"
arch=('x86_64')
url="https://www.laborejo.org/agordejo/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'new-session-manager' 'python'
'python-pyqt5' 'ttf-dejavu')
source=("https://laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('35042de2efc44391954f65fcd4eb08b2c70f09a517af23bcc6ec5ad102fd87aaba9d8b9839b0c56f5d033dc2d010039e28efa7fe34ec99066f1a463bc014c812'
            'SKIP')
b2sums=('9fd819bde169a872e990c8e78a7990c2552969ff04d737a2b3600ab3a12e468fc9ba52dccb1275f25b9773250f582f26bd9117e66ea190485992053f15c5cbf9'
        'SKIP')
validpgpkeys=('45D952EF384ADFBB00913E3428C6A306F2909FEE') # Nils Hilbricht <nils@hilbricht.com>

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
