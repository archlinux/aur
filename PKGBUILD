# Maintainer: Gabriel de Oliveira <gabrielhk3 at gmail dot com>

pkgname=spotx-linux
pkgver='1.2.3.1115_1'
pkgrel=3
pkgdesc='Spotify Ad blocker based on SpotX for Linux'
arch=('any')
url='https://github.com/Nuzair46/SpotX-Linux'
license=('custom')
source=('install-spotx.hook'
    'git+https://github.com/Nuzair46/SpotX-Linux.git')
sha256sums=('c21a8d0f772848e5d3c7ea6d7beeb8c3cfb805ccbe169a03c19af9027cb69c51'
    'SKIP')

pkgver() {
    cd "$srcdir/SpotX-Linux"
    grep SPOTX_VERSION install.sh | head -n1 | cut -d= -f2 | tr -d \" | sed 's/-/_/'
}

package() {
    cd "$srcdir"
    install -Dm644 "install-spotx.hook" "$pkgdir/usr/share/libalpm/hooks/install-spotx.hook"
    install -Dm644 "SpotX-Linux/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    mkdir -p "$pkgdir/opt/SpotX-Linux"
    mv "SpotX-Linux" "$pkgdir/opt"
}
