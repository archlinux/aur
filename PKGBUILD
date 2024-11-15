# Maintainer: Denys Vitali <denys@denv.it>
pkgname=pong
pkgver=2.0.8
pkgrel=2
pkgdesc="pong is not ping. pong is CLI game. "
reponame=pong-command
arch=('any')
url="https://github.com/kurehajime/pong-command"
license=('MIT')
groups=()
makedepends=('git' 'go')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${pkgname}::"https://github.com/kurehajime/pong-command/archive/v${pkgver}.tar.gz")
md5sums=('SKIP')


build() {
  cd "$srcdir/${reponame}-${pkgver}/"
  ls -la
  go get -v ./pong
  go build -o "$srcdir/${reponame}-${pkgver}/pong.bin" ./pong
}


package() {
  install -m755 -d "${pkgdir}/usr/bin"
  cp "${srcdir}/${reponame}-${pkgver}/pong.bin" "${pkgdir}/usr/bin/pong"
}
