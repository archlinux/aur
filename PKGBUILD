# Maintainer: Tony André Haugen (t0nyandre) <post@tonyand.re>

pkgbase=libsass-git
pkgname=libsass-git
pkgver=3.5.2
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor (library)."
arch=("x86_64")
url="http://sass-lang.com/libsass"
license=("MIT")
source=("libsass-$pkgver.tar.gz::https://github.com/sass/libsass/archive/$pkgver.tar.gz")
sha256sums=("9914239d73fc0882f09e0d67e89260d661c3a76940550034722f492d178b57e2")

build() {
        cd "$srcdir/libsass-$pkgver"

        autoreconf -i
        ./configure --prefix=/usr
        make
}

package() {
          cd "$srcdir/libsass-$pkgver"

          make DESTDIR="$pkgdir/" install
          install -D -m644 LICENSE "$pkgdir/usr/share/licenses/libsass/LICENSE"
}
