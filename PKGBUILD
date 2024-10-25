# Maintainer: Sebastian Westberg <sebastian@westberg.io>
pkgname=tera
pkgver=0.4.3
pkgrel=1
pkgdesc="Interactive Bash script terminal music radio player. Play your favorite radio station, CRUD your favorite lists, and explore new radio stations from your terminal."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/shinokada/tera"
license=('MIT')
depends=('bash' 'mpv' 'jq' 'fzf' 'github-cli' 'wget' 'python')
source=("https://github.com/shinokada/tera/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('abc77037f423d91501e5c6d8d27298115020501a7dd634bfc87d8b09207b816f')

build() {
    cd "$srcdir/$pkgname-$pkgver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    # Install the main script to /usr/bin
    install -Dm755 tera "$pkgdir/usr/bin/tera"

    # Install all scripts from the lib directory to /usr/bin/lib
    install -d "$pkgdir/usr/bin/lib"
    install -Dm755 lib/* "$pkgdir/usr/bin/lib/"
}
