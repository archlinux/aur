# Maintainer: Limao Luo <luolimao+AUR@gmail.com>

pkgname=qprint
pkgver=1.1
pkgrel=1
pkgdesc="Quoted-Printable format (RFC1521) encode / decode."
arch=(i686 x86_64)
url=http://www.fourmilab.ch/webtools/$pkgname
license=('custom:public domain')
source=($url/$pkgname-$pkgver.tar.gz)
sha256sums=('ffa9ca1d51c871fb3b56a4bf0165418348cf080f01ff7e59cd04511b9665019c')
sha512sums=('4748f52cc8cabf72a2685fba93ee9957a9a36658a8b0c9fc1994e1779aad59a94b942ed3dd2501c6a35636e7c75e24d512a5de5f95b0ba66ae40acee8bbe1cca')

build() {
    cd $pkgname-$pkgver/
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd $pkgname-$pkgver/
    install -d "$pkgdir"/usr/{bin,share/man/man1}
    make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
