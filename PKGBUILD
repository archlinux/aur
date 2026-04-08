# Maintainer: Devel <Denislav08@proton.me>
# Contributor: Sebastian Westberg <sebastian@westberg.io>
pkgname=tera
pkgver=3.11.0
pkgrel=1
pkgdesc="Interactive Bash script terminal music radio player. Play your favorite radio station, CRUD your favorite lists, and explore new radio stations from your terminal."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/shinokada/tera"
license=('MIT')
depends=('bash' 'mpv' 'jq' 'fzf' 'github-cli' 'wget' 'python')
source=("https://github.com/shinokada/tera/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8dfa0bf0e4a4d4c823ab5941e26f0bedc1b2e8079cfb7f6c479cff2c8303ef07')

build() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="$pkgdir"

    # Install the main script to /usr/bin
    install -Dm755 tera "$pkgdir/usr/bin/tera"

}
