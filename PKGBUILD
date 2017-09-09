# Maintainer: Alexandru Moșoi <brtzsnr@gmail.com>

pkgname=zurichess
pkgver=11
pkgrel=1
pkgdesc='A free open source strong chess engine.'
url='http://www.zurichess.xyz'
license=('BSD')
makedepends=('go>=1.8')
optdepends=('xboard')
source=('https://bitbucket.org/zurichess/zurichess/get/release.neuchatel.tar.gz')
noextract=('release.neuchatel.tar.gz')
sha256sums=('7fc807e915c1a366caef358778a96a46918669bb247638450f0b7477870914df')
arch=('x86_64')

prepare () {
tar xzvf release.neuchatel.tar.gz
mkdir -p src/bitbucket.org/zurichess/
mv zurichess-zurichess-f5f1b02de174 src/bitbucket.org/zurichess/zurichess
}

build() {
export GOPATH=`pwd`
cd src/bitbucket.org/zurichess/zurichess/zurichess
go install .
}

package() {
mkdir -p $pkgdir/usr/bin
cp bin/zurichess $pkgdir/usr/bin
}
