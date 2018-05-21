# Maintainer: Étienne Deparis <etienne@depar.is>

pkgname=goodvibes
pkgver=0.3.7
pkgrel=1
pkgdesc="Lightweight internet radio player"
arch=('i686' 'x86_64')
url="https://github.com/elboulangero/goodvibes"
license=('GPL')
depends=("glib2" "dconf" "gtk3" "libsoup" "libkeybinder3"
         "gst-plugins-base" "gst-plugins-good" "gst-plugins-ugly")
source=("https://github.com/elboulangero/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('610f3a3cf1332b6894b9b851605dd3a97dcaf9f24076c98a2af65a7eb50f7f27')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    ./autogen.sh
    ./configure --prefix=/usr --enable-all
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir" install
}
