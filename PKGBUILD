# Maintainer: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=spectrum3d
pkgver=2.5.0
pkgrel=2
pkgdesc="An audio spectrum analyser in 3D for Linux"
url="http://spectrum3d.sourceforge.net/index.html"
license=('GPL3')
arch=('i686' 'x86_64')
makedepends=("automake" "glu")
depends=("gtk3" "gstreamer0.10" "sdl" "alsa-lib")
optdepends=("gstreamer0.10-bad-plugins" "gstreamer0.10-ugly-plugins" "jack")
source=("https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('428fb8e51ef01f7287e00d75ac6ff19ea1088d36ac77e38b6a0f5c4c9144b91a317ea4f0e549d197ecda79737e3183e573b331afe55383afcf3b93303bc96274')
whirlpoolsums=('7da32c5fcc18a34d3fede8704339a1ca33ad40a541c3892fe0d14b7f08ae012f0b2c3dbed08067100700729fc53b7e927fea352c07ff2276f7b28c27d10f375b')


build() {
cd "$srcdir/$pkgname-$pkgver/"
     ./configure --prefix=/usr/
     make 
}

package() {
cd "$srcdir/$pkgname-$pkgver/"
   make DESTDIR="$pkgdir/" install
}
