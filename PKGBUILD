# Maintainer: Chenx Dust <chenxijun2247338@hotmail.com>
pkgname=protoscope
pkgver=8e7a6aafa2c9958527b1e0747e66e1bfff045819
pkgrel=1
pkgdesc="A simple language to represent and emit the Protobuf wire format."
arch=('any')
url="https://github.com/protocolbuffers/protoscope"
license=('Apache')
makedepends=('go')
provides=('protoscope')

build() {
    export GOPATH=$srcdir
    go install github.com/protocolbuffers/protoscope/cmd/protoscope...@latest
}

package() {
    install -d -m755 $pkgdir/usr/bin/
    cp -a $srcdir/bin/protoscope $pkgdir/usr/bin/
}
