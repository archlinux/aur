# Maintainer: darkmagicsauce <caitlyn dot williams at proton dot me>

pkgname=yaabsa-bin
pkgver=1.4.4
pkgrel=1
pkgdesc="Unofficial feature rich, responsive, modern client for Audiobookshelf"
arch=('x86_64')
url="https://github.com/Vito0912/yaabsa"
license=('AGPL-3.0-only')
depends=('mpv' 'libsecret')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/Vito0912/yaabsa/releases/download/v${pkgver}-pre/linux-bundle-yaabsa_v${pkgver}.tar.gz"
    "yaabsa.desktop"
)

package() {
    install -dm755 "$pkgdir/usr/bin/$pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons"

    cp -r "$srcdir/lib" "$pkgdir/usr/bin/$pkgname/"
    cp -r "$srcdir/data" "$pkgdir/usr/bin/$pkgname/"

    install -m755 -t "$pkgdir/usr/bin/$pkgname" "$srcdir/yaabsa"

    ln -s "/usr/bin/$pkgname/yaabsa" "$pkgdir/usr/bin/yaabsa"
    ln -s "/usr/bin/$pkgname/data/flutter_assets/assets/logo_blue_fill.png" "$pkgdir/usr/share/icons/yaabsa.png"

    install -m644 "$srcdir/yaabsa.desktop" "$pkgdir/usr/share/applications/"
}

sha256sums=('3ba464cc8bf501562278167760117482d664aa47761c36fd7c00da836fb9bd57'
            '1aabc114d8ccc4d4e02e2491828f7c94f304890666724d39337c4614ac0a3b92')
