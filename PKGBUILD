# Maintainer: Mikołaj Baranowski <mikolajb@gmail.com>

pkgname=dbxcli
pkgver=2.0.1
pkgrel=1
pkgdesc='A command line client for Dropbox built using the Go SDK'
license=('Apache')
arch=('x86_64' 'i686')
url='https://github.com/dropbox/dbxcli'
depends=()
makedepends=('go')

source=("https://github.com/dropbox/dbxcli/archive/v${pkgver}.zip")
md5sums=('eed40a3d763f0390bd67d96d90681e50')

build() {
  msg2 'Compiling...'

  mkdir -p ${srcdir}/src/github.com/dropbox
  mv -f ${pkgname}-${pkgver} ${srcdir}/src/github.com/dropbox/${pkgname}
  GOPATH=${srcdir} go build -o ${pkgname} github.com/dropbox/${pkgname}
}

package() {
  msg2 'Installing...'

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
