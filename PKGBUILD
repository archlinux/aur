# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=agordejo
pkgver=0.2.1
pkgrel=1
pkgdesc="A music production session manager"
arch=('x86_64')
url="https://www.laborejo.org/agordejo/"
license=('GPL3')
groups=('pro-audio')
depends=('glibc' 'hicolor-icon-theme' 'new-session-manager' 'python'
'python-pyqt5' 'ttf-dejavu')
# TODO: remove provides/conflicts/replaces 2021-01-31
provides=('argodejo')
conflicts=('argodejo')
replaces=('argodejo')
source=("https://laborejo.org/downloads/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha512sums=('bf96095bc0389695dfc202db084d8903ef36e12a6be137ca3e044c7ae78fa60371844977029d6167b6db5f9e3f13462507d4ed3dcac9c54cf5f4dc4b13fb38ad'
            'SKIP')
b2sums=('529adafcae61bcc700325e936f988ff37dddd15d944c4406a0e98b97972f058916bcbe057808007228f371ac34eca0331b9cec0cf00b4d7cf64a072e18cb2fdf'
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
