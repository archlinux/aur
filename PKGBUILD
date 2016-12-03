# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=dbxcli
pkgver=1.4.0
pkgrel=1
pkgdesc='A command line client for Dropbox built using the Go SDK'
license=('Apache')
arch=('x86_64' 'i686')
url='https://github.com/dropbox/dbxcli'
depends=()
makedepends=('go')

source=("https://github.com/dropbox/dbxcli/archive/v${pkgver}.zip")
md5sums=('a900192623494cbe4edbd941fe78491c')

build() {
  msg2 'Compiling...'

  mkdir -p src/github.com/dropbox
  mv -f ${pkgname}-${pkgver} src/github.com/dropbox/${pkgname}
  GOPATH=${srcdir} go build -o ${pkgname} github.com/dropbox/${pkgname}
}

package() {
  msg2 'Installing...'

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
