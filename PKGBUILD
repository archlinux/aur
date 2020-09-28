# Maintainer: Justin Coffman <jcoffman@uid0.io>
# Contributor: Justin Coffman <jcoffman@uid0.io>

pkgname=tinyfugue
pkgver=5.0b8
pkgrel=7
arch=('i686' 'x86_64')
pkgdesc="a flexible, screen-oriented MUD client, for use with any type of MUD"
url="http://tinyfugue.sourceforge.net/"
license=('GPL3')
depends=(
    'openssl'
    'pcre'
)
source=("https://github.com/cipherize/tinyfugue/releases/download/v$pkgver-$pkgrel/tf-$pkgver-$pkgrel.tar.gz")
b2sums=('01c4a9e63368d197d3251adf751e705ae6dd0fdb098524337f2e48256fb0e6ca46b35b7cb932b0b11ca887f5690f65f1c1cae0f81523bcee60652f354c22bd18')
sha256sums=('d7e53ee7647c20ea97c49aadb07e6906c8ff44639af64433dfd70e459286964e')

build() {
    ./configure --prefix=/usr
    make
}

package() {
    mkdir "$pkgdir/usr"
    make prefix="$pkgdir/usr" -j1 install

    install -d "$pkgdir/usr/share/man/man1"
    install -m 644 src/tf.1.nroffman "$pkgdir/usr/share/man/man1/tf.1"
}
