# Maintainer: Gabriel de Oliveira <gabrielhk3 at gmail dot com>

pkgname=spotx-linux
pkgver='1.2.3.1115_1'
pkgrel=6
pkgdesc='Spotify Ad blocker based on SpotX for Linux'
arch=('any')
url='https://github.com/Nuzair46/SpotX-Linux'
license=('custom')
source=('install-spotx.hook'
    'git+https://github.com/Nuzair46/SpotX-Linux.git')
sha256sums=('61f2bf9cfc6b16e00b557a372621f17521b64573d3eaa21aa5805ee822cb686a'
    'SKIP')

pkgver() {
    cd "$srcdir/SpotX-Linux"
    grep SPOTX_VERSION install.sh | head -n1 | cut -d= -f2 | tr -d \" | sed 's/-/_/'
}

package() {
    cd "$srcdir"
    install -Dm644 "SpotX-Linux/readme.md" "$pkgdir/opt/SpotX-Linux/readme.md"
    install -Dm755 "SpotX-Linux/install.sh" "$pkgdir/opt/SpotX-Linux/install.sh"
    install -Dm755 "SpotX-Linux/uninstall.sh" "$pkgdir/opt/SpotX-Linux/uninstall.sh"
    install -Dm644 "SpotX-Linux/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "install-spotx.hook" "$pkgdir/usr/share/libalpm/hooks/install-spotx.hook"
}
