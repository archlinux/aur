# Maintainer: nezbednik <nezbedniklmao at gmail dot com>

pkgname="unrar-libre"
pkgver="0.0.1"
pkgrel="1"
pkgdesc="Free software RAR archive extractor compatible with proprietary WinRAR CLI"
arch=("any")
url="https://github.com/abelianring/unrar-libre"
license=("custom")
makedepends=("go")
provides=("unrar")
conflicts=("unrar")
_commit="0ae0ae481fb72d21f1f579ada1b808ab126b5cd4"
_path="/unrar-libre-${_commit}/cmd/unrar"
source=("https://github.com/abelianring/unrar-libre/archive/${_commit}.zip")
sha256sums=("2cca3cdf5c4a0247e894fe1cdd75abcf8054cabc3425c7206e22c922ed2a2586")

build() {
    cd ${srcdir}${_path}
    go build -ldflags "-s" main.go
}

package() {
    install --mode 775 -D ${srcdir}${_path}/main ${pkgdir}/usr/bin/unrar
}
