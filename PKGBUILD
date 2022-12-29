# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="vanitygen-plusplus-git"
pkgver=0.1.0.r18.gc072eb5
pkgrel=1
pkgdesc="A vanity address generator for more than 100 crypto currencies"
url="https://github.com/10gic/vanitygen-plusplus"
license=("AGPL3")
arch=("x86_64" "armv7h" "aarch64")
depends=("curl" "opencl-headers")
makedepends=("git")
source=("git+$url.git")
sha256sums=("SKIP")

pkgver(){
 cd "vanitygen-plusplus"
 git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build(){
 cd "vanitygen-plusplus"
 make all
}

package(){
 cd "vanitygen-plusplus"
 install -D "keyconv" "$pkgdir/usr/bin/keyconv"
 install -D "oclvanitygen++" "$pkgdir/usr/bin/oclvanitygen++"
 install -D "oclvanityminer" "$pkgdir/usr/bin/oclvanityminer"
 install -D "vanitygen++" "$pkgdir/usr/bin/vanitygen++"
 install -D -m 664 "base58prefix.txt" "$pkgdir/usr/share/vanitygen++/base58prefix.txt"
}


