# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=gimp-fourier
pkgver=0.4.3
pkgrel=6
pkgdesc="A GIMP plugin to do the fourier transform"
arch=(i686 x86_64)
license=(GPL)
url="https://www.lprp.fr/gimp_plugin_en/#fourier"
depends=(fftw gimp)
# source=("https://people.via.ecp.fr/~remi/soft/gimp/fourier-${pkgver}.tar.gz")
# source=("http://registry.gimp.org/files/fourier-0.4.3-2.tar.gz")
# source=("https://github.com/pixlsus/registry.gimp.org_static/blob/master/registry.gimp.org/files/fourier-0.4.3-2.tar.gz?raw=true")
source=(https://www.lprp.fr/files/old-web/soft/gimp/fourier-${pkgver}.tar.gz)
sha256sums=('562f99f7146ed6a0afda7fdfaaf8e063c3c13b9ba38b817a535568ac3672c755')

build() {
  cd fourier-$pkgver
  make clean # source tarball includes the compiled binary
  make
}

package() {
  cd fourier-$pkgver
  install -Dm0755 fourier "$pkgdir/usr/lib/gimp/2.0/plug-ins/fourier"
}

# vim: set ts=2 sw=2 et:
