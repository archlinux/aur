# Maintainer: Siddhant Madhur <siddhant.madhur@gmail.com>
pkgname=bmo
pkgver=v2.0.stable
pkgrel=1
pkgdesc="CLI tool to improve developement experience for traditional compiled web servers"
arch=(x86_64)
url="https://github.com/siddhantmadhur/bmo"
license=(GPL-3.0)
makedepends=(git go)
depends=()
provides=(bmo)
source=("bmo::git+https://github.com/siddhantmadhur/bmo.git")
sha256sums=(SKIP)

pkgver () {
    cd bmo
    git describe --tags --abbrev=0
}


build() {
    cd bmo
    go build -ldflags="-X 'main.version=${pkgver}'" -o bmo 
}

package() {
    cd bmo
    install -Dm755 bmo -t "${pkgdir}/usr/bin" 
}
