# Maintainer: Namkhai B. <echo hc.9mobkrof@em | rev>

pkgname=gyr
pkgver=0.1.0
pkgrel=1
pkgdesc='Blazing fast TUI launcher for *BSD and Linux'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~forkbomb9/gyr"
license=('BSD-2-Clause')
makedepends=('rust')
provides=('gyr')
conflicts=('gyr')
source=("https://git.sr.ht/~forkbomb9/gyr/archive/v${pkgver}.tar.gz")
sha256sums=('ede4bc7bce8321a353d78ce05eff49e43f598f4030a4b3cee6298029135d9e99')
b2sums=('679d79663639eed149edb933759481e386035d050cb31a3db8a6a344705dabc8a418f94dc7104784a0a6b58e43958e9371c1b53091f686140d44d0411650a91d')

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
