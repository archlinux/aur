# Maintainer: axionl <axionl@aosc.io>
pkgname=filebrowser-bin
pkgver=1.8.0
pkgrel=1
pkgdesc="Web File Manager which can be used as a middleware or standalone app."
arch=('x86_64')
url="https://github.com/filebrowser/filebrowser"
license=('Apache')
depends=('glibc')
provides=("filebrowser")
conflicts=("filebrowser")
install="$pkgname.install"

source=('filebrowser@.service' 'config.json' 'filebrowser-bin.install'
        'https://raw.githubusercontent.com/hacdias/filebrowser/master/LICENSE.md')

source_x86_64=(https://github.com/filebrowser/filebrowser/releases/download/v$pkgver/linux-amd64-filebrowser.tar.gz)

sha256sums=('031102764271b433d7910fd13289cf65e9b414f01ae83ff39876f8d642f1172c'
            '45e2e154a3cf25ad72263f6617d5df330fade65a944921dcbee86692c09e4ac8'
            '82e9879a58d21f4ca4a28315f94ffdadfbbf461752e63252bf12b91de93bc9c8'
            '9cf5de169b595cdae317551ef69a794b59fa3d1e151db4190d337fe08d13d5f8')
sha256sums_x86_64=('af2684787d0f9ee49e6c66409033e5fa8e609a38780ff9b45f3d53379d6c3d32')

package() {
    install -Dm644 filebrowser@.service ${pkgdir}/usr/lib/systemd/system/filebrowser@.service
    install -Dm644 config.json ${pkgdir}/etc/filebrowser/example.config.json
    install -Dm755 LICENSE.md ${pkgdir}/usr/share/licenses/filebrowser-bin/LICENSE
    install -Dm755 $srcdir/filebrowser ${pkgdir}/usr/bin/filebrowser
}
# vim set: ts=4 sw=4 et:
