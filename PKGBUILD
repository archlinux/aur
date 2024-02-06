# Maintainer: Gabriel de Oliveira <gabrielhk3 at gmail dot com>

pkgname=spotx-linux
pkgver='1.2.3.1115_1'
pkgrel=11
pkgdesc='Spotify Ad blocker based on SpotX for Linux'
arch=('any')
url='https://github.com/Nuzair46/SpotX-Linux'
license=('custom')
source=('install-spotx.hook'
    'git+https://github.com/Nuzair46/SpotX-Linux.git')
sha256sums=('853be7a3223f0ca744b84a8f94b9c153dd666cde1a4ffabe53e95d11ec29200a'
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
