# Maintainer: Youngbin Han <sukso96100@gmail.com>
pkgname=micro-git
pkgver=957e97d
pkgrel=1
pkgdesc="A modern and intuitive terminal-based text editor"
arch=('x86_64' 'i686')
url="https://github.com/zyedidia/micro"
license=('MIT')
makedepends=('go' 'git')
optdepends=(xclip)
source=("${pkgname}"::"git+https://github.com/zyedidia/micro.git")
md5sums=(SKIP)
pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-parse --short HEAD)"
}
build(){
 cd "${srcdir}/${pkgname}"
 export GOPATH=${srcdir}/${pkgname}
 make
 make install
}
package(){
 install -Dm755 $srcdir/$pkgname/bin/micro "$pkgdir/usr/bin/micro"
 install -Dm644 $srcdir/$pkgname/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
