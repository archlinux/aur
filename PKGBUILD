# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.2.0
pkgrel=1
pkgdesc="A music production session manager"
arch=('x86_64')
url="https://www.laborejo.org/agordejo/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'new-session-manager' 'python'
'python-pyqt5' 'ttf-dejavu')
makedepends=('nuitka')
# TODO: remove provides/conflicts/replaces 2021-01-31
provides=('argodejo')
conflicts=('argodejo')
replaces=('argodejo')
source=("https://laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('4bb9bd0b795bd34b204d1ce71edcb15da8e668c6b3b3289f4260428f4a4253da179451218a3f4439608a5c2ba6a415e17a5235e3162b4dac9064d2e0916141cd'
            'SKIP')
b2sums=('dadfe275ba3addf1f735ce288f288083841b1c3dd24ecbdf3ee8c11165efee9bc9692534cff6eba439e11aab6412b6bb443209a3d21f6c70bb48d859ebfaf3dd'
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
