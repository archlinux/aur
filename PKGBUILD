# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: tarkah <github dot com slash tarkah>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>

pkgname=lazystream-git
pkgver=1.9.4.20200226
pkgrel=1
pkgdesc="Easily get LazyMan stream links, output directly or to m3u / xmltv formats. Streams can also be recorded or casted."
arch=('any')
url='https://github.com/tarkah/lazystream'
license=('GPL2')
depends=('rust' 'streamlink')
optdepends=('vlc')

source=("git+$url.git")

build() {
    cd "$srcdir/lazystream"
    rm -rf target
    cargo build --release
}

package() {
    install -Dm755 lazystream/target/release/lazystream "$pkgdir/usr/bin/lazystream"
}

md5sums=('SKIP')
