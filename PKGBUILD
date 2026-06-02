# Maintainer: JGH0 <jgh0@users.noreply.github.com>

pkgname=waifufetch
pkgver=1.3.2
pkgrel=1
pkgdesc="System info with a random waifu decoration -- like fastfetch with anime"
arch=('any')
url="https://github.com/JGH0/waifufetch"
license=('MIT')
depends=('curl' 'jq')
optdepends=('kitty: native image display in kitty terminal'
            'chafa: terminal image display in any terminal'
            'jp2a: black and white ASCII art fallback'
            'img2txt: colored ASCII art fallback (caca-utils)')
source=("$pkgname-$pkgver.tar.gz::https://github.com/JGH0/$pkgname/archive/v1.3.2.tar.gz")
sha256sums=('ff3f3a8b66cee14c28582827a26e321503b139b2e011b15a6d910f82fa5aae7a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 libwaifu.sh "$pkgdir/usr/bin/libwaifu.sh"
    install -Dm755 waifu "$pkgdir/usr/bin/waifu"
    install -Dm755 waifufetch "$pkgdir/usr/bin/waifufetch"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
