# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno-bin
_pkgname=bruno
pkgdesc="Opensource IDE For Exploring and Testing Api's"
pkgver=0.14.1
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
    "f48016d6e4e539ef39bafbc6856c5ba7b65ee05917fbba4a55715b80835a7325"
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
