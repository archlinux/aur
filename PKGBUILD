# Maintainer: Vysakh Premkumar <vysakhpr218@gmail.com>
# Contributor:  David Sherriff <d.sherriff.81@gmail.com> 
pkgname=pooi
pkgver=1.0.0
pkgrel=1
pkgdesc="trivia on the commandline"
arch=('x86_64')
url="https://gitlab.com/tellmeY/pooi"
license=('GPL3')
depends=('rust' 'cargo')
source=("https://gitlab.com/tellmeY/$pkgname/-/archive/v$pkgver/pooi-v$pkgver.tar.gz")
sha256sums=('6a26ffb97233263a93de23033245780acc8a62cc7b2d7214d5d2495ea2f4c16d')

build() {
    cd "$srcdir"
    cargo build --release
}

package() {
    cd "$srcdir"
    install -Dvm755 "./target/release/pooi" -t "$pkgdir/usr/local/bin"
    install -Dvm644 ./etc/completions/_pooi $pkgdir/usr/share/zsh/site-functions/_pooi
    install -Dvm644 ./etc/completions/pooi.bash $pkgdir/usr/share/bash-completion/completions/pooi
    install -Dvm644 ./etc/completions/pooi.fish $pkgdir/usr/share/fish/vendor_completions.d/pooi.fish

    # Install files into the package (e.g., make install)
}
