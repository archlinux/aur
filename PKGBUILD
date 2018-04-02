# Maintainer: Denys Vitali <denys@denv.it>
pkgname=pong
pkgver=2.01
pkgrel=1
pkgdesc="pong is not ping. pong is CLI game. "
reponame=pong-command
arch=('any')
url="https://github.com/kurehajime/pong-command"
license=('MIT')
groups=()
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(${pkgname}::"https://github.com/kurehajime/pong-command/archive/${pkgver}.tar.gz")
md5sums=('SKIP')


build() {
  cd "$srcdir/${reponame}-${pkgver}/"
  go build -o "$srcdir/${reponame}-${pkgver}/pong_out" -i pong/*
}


package() {
  install -m755 -d "${pkgdir}/usr/bin"
  cp "${srcdir}/${reponame}-${pkgver}/pong_out" "${pkgdir}/usr/bin/pong"
}
