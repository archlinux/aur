pkgname=filegive
pkgver=0.7.1
pkgrel=2
pkgdesc="Easy sending of files, point-to-point"
url="http://vicerveza.homeunix.net/~viric/cgi-bin/filegive"
arch=('x86_64' 'i686')
license=('AGPLv3')
depends=('go')
source=("http://vicerveza.homeunix.net/~viric/cgi-bin/filegive/tarball/filegive-${pkgver}.tar.gz?uuid=v${pkgver}")
sha256sums=('0ae1b575506d0884a60a58a4705c7a92fb9d82535f473a91b03026848d8bde93')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p go
  export GOPATH="${srcdir}/${pkgname}-${pkgver}/go"
  go get code.google.com/p/go-nat-pmp
  go build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 filegive-${pkgver} "$pkgdir/usr/bin/filegive"
}

