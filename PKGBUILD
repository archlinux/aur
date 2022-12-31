#Maintainers: MrPicklePinosaur
pkgname=matsuba-git
pkgver=1.0
pkgrel=1
pkgdesc="lightweight japanese ime written in rust"
arch=('x86_64')
url="https://github.com/MrPicklePinosaur/matsuba"
license=('MIT' 'Apache')
groups=()
provides=(matsud matsucli)
depends=(xdotool xorg-xmodmap sqlite3)
makedepends=(cargo)
source=("git+$url")
md5sums=('SKIP')

package() {
    cd matsuba
    cargo build --release --target x86_64-unknown-linux-gnu

    install -Dm755 target/x86_64-unknown-linux-gnu/release/matsud "${pkgdir}/usr/bin/matsud"
    install -Dm755 target/x86_64-unknown-linux-gnu/release/matsucli "${pkgdir}/usr/bin/matsucli"
    install -Dm644 matsuba_default.toml "${pkgdir}/usr/share/matsuba/matsuba_default.toml"
}

