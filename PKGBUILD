# Maintainer: Mario Finelli <mario dot finelli at yahoo dot com>

pkgname=gimp-fourier
pkgver=0.4.3
pkgrel=2
pkgdesc="A GIMP plugin to do the fourier transform."
arch=(i686 x86_64)
license=('GPL')
url="http://people.via.ecp.fr/~remi/soft/gimp/gimp_plugin_en.php3#fourier"
depends=('fftw' 'gimp')
source=("http://people.via.ecp.fr/~remi/soft/gimp/fourier-$pkgver.tar.gz")
sha256sums=('562f99f7146ed6a0afda7fdfaaf8e063c3c13b9ba38b817a535568ac3672c755')

build() {
  cd "$srcdir"/fourier-$pkgver
  make
}

package() {
  cd "$srcdir"/fourier-$pkgver
  install -Dm755 fourier "$pkgdir/usr/lib/gimp/2.0/plug-ins/fourier"
}
