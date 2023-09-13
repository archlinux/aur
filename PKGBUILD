# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno-bin
_pkgname=bruno
pkgdesc="Opensource IDE For Exploring and Testing Api's"
pkgver=0.13.2
pkgrel=1
arch=('x86_64')
url="https://github.com/usebruno/bruno"
license=('MIT')
provides=('bruno')
conflicts=('bruno')

source=(
    "https://github.com/usebruno/bruno/releases/download/v${pkgver}/bruno_${pkgver}_amd64_linux.deb"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/usebruno/bruno/v${pkgver}/license.md"
)

sha256sums=(
    "85d24dfa729bb0510b5e54811d975e419881f85145444a8a0cda1848f0393c4a"
    "8891070a847e5047bf77d38d88d7dfbab1beab41e37c802b9f5b23f2bbb9c7be"
)

package() {
    cd $pkgdir

    # There should be a way to only use the asar file but I don't know how to make it work yet.
    tar -vxf $srcdir/data.tar.xz

    mkdir -p usr/bin
    ln -sf /opt/Bruno/bruno usr/bin/bruno

    install -D -m0644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
