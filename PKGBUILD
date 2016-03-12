# $Id$
# Maintainer: Marcus Behrendt <marcus dot behrendt dot eightysix(in numbers) at bigbrothergoogle dot com

_basename=rust-arm
pkgname=rust-arm-bin
pkgver=1.7.0
epoch=1
pkgrel=1
_binname=$_basename-$pkgver-bin.tar.gz
arch=(armv6h armv7h)
pkgdesc='Systems programming language focused on safety, speed and concurrency'
url='http://www.rust-lang.org/'
license=('MIT' 'Apache')

provides=("rust=$pkgver")
conflicts=("rust")

source_armv6h=($_binname::https://www.dropbox.com/s/l8c3r58q2cwrcd1/rust-1.7.0-stable-2016-02-29-a5d1e7a-arm-unknown-linux-gnueabihf-537ce7aae4574a69c077fe2e358c7b50c3e085ba.tar.gz)
md5sums_armv6h=('a010d0228c9d2c6429ee6c5f1875d19d')

source_armv7h=($_binname::https://www.dropbox.com/s/9cs3kizf6fbbfcl/rust-1.7.0-stable-2016-02-29-a5d1e7a-arm-unknown-linux-gnueabihf-4385f17e0ba0a941032cd2389643e846346fa9db.tar.gz)
md5sums_armv7h=('7e8252d4c3d42698e9ca466f277855a2')

noextract=("$_binname")

install="$pkgname.install"
options=('staticlibs' '!strip')


package() {

    mkdir "$pkgdir"/usr

	tar -xf $srcdir/$_binname -C "$pkgdir"/usr

    cd "$pkgdir/usr/lib"
    rm rustlib/{components,manifest-rustc,rust-installer-version}
    ln -sf rustlib/arm-unknown-linux-gnueabihf/lib/*.so .
}
