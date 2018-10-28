# Maintainer: Mario Finelli <mario at finel dot li>

pkgname=gimp-fourier
pkgver=0.4.3
pkgrel=5
pkgdesc="A GIMP plugin to do the fourier transform."
arch=('i686' 'x86_64')
license=('GPL')
url="https://people.via.ecp.fr/~remi/soft/gimp/gimp_plugin_en.php3#fourier"
depends=('fftw' 'gimp')
# source=("https://people.via.ecp.fr/~remi/soft/gimp/fourier-${pkgver}.tar.gz")
# source=("http://registry.gimp.org/files/fourier-0.4.3-2.tar.gz")
source=("https://github.com/pixlsus/registry.gimp.org_static/blob/master/registry.gimp.org/files/fourier-0.4.3-2.tar.gz?raw=true")
sha256sums=('048534454022508d573a0023751bd25f91773fb002c2a1fac3141dd39467eae6')

build() {
    cd "$srcdir/fourier-$pkgver"
    make
}

package() {
    cd "$srcdir/fourier-$pkgver"
    install -Dm0755 fourier "$pkgdir/usr/lib/gimp/2.0/plug-ins/fourier"
}
