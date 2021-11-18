# Maintainer: Kival Mahadew <kivalm@protonmail.com>
pkgname=spotblock-rs
pkgver=0.9.4
pkgdesc="Spotify Advertisment muter for linux"
pkgrel=1
depends=('playerctl')
makedepends=('rust' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://github.com/StarPlatin4m/spotblock-rs'
license=('GPL3')
source=("$pkgname::git+https://github.com/StarPlatin4m/spotblock-rs")
md5sums=('SKIP')


build() {
    cd "$pkgname"
    cargo build --release
    return 0
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    cp "${srcdir}/spotblock-rs/target/release/spotblock-rs" "${pkgdir}/usr/bin/spotblock-rs"
    cp "${srcdir}/spotblock-rs/run.sh" "${pkgdir}/usr/bin/spotblock-run"
    mkdir "${pkgdir}/usr/share"
    mkdir "${pkgdir}/usr/share/applications"
    cp "${srcdir}/spotblock-rs/Spotblock.desktop" "${pkgdir}/usr/share/applications/spotblock.desktop"
    chmod +x "${pkgdir}/usr/bin/spotblock-rs"
    chmod +x "${pkgdir}/usr/bin/spotblock-run"

}
