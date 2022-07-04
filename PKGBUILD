# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr
pkgver=0.1.0
pkgrel=2
pkgdesc='Blazing fast TUI launcher for GNU/Linux and *BSD'
arch=('any')
url="https://sr.ht/~forkbomb9/gyr"
license=('BSD-2-Clause')
makedepends=('rust')
provides=('gyr')
conflicts=('gyr')
source=("https://git.sr.ht/~forkbomb9/gyr/archive/v${pkgver}.tar.gz")
sha256sums=('dccaa1ff2896bf92836596724c6b81b043f162232766571194c55113bdfbadf7')
b2sums=('6591d3dc4bd96a4579c7b18af42470b73966b03514149677b2f076b231a56be5e3340551dcf75208b8a3b5875419cc4e3cbe4c308901612e89a11913c84b05d7')

build() {
    cd ${pkgname}-v${pkgver}
    cargo build --release
}

package() {
    cd ${pkgname}-v${pkgver}
    strip "target/release/${pkgname}"
    install -Dm755 "target/release/${pkgname}" \
        -t "${pkgdir}/usr/bin"
}
