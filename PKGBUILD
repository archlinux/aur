# Maintainer: blacktea <blackteahamburger@outlook.com>

pkgname=cdm
pkgver=0.7
pkgrel=1
pkgdesc="The Console Display Manager"
arch=('any')
url="https://github.com/evertiro/cdm"
license=('GPL')
depends=('dialog' 'xorg-xinit' 'xorg-xdpyinfo' 'kbd')
conflicts=('cdm-git')
backup=('etc/cdmrc')
source=("https://github.com/evertiro/cdm/archive/$pkgver.tar.gz")
md5sums=('635e66dde62dea014c2394de66d8361d')

package() {
    install -d "$pkgdir/usr/bin" "$pkgdir/etc" "$pkgdir/usr/share/doc/cdm/themes"
    cd "$srcdir/$pkgname-$pkgver/src"
    install -Dm755 cdm cdm-xlaunch "$pkgdir/usr/bin"
    install -Dm644 cdmrc "$pkgdir/etc/cdmrc"
    install -Dm644 ../README.md profile.sh "$pkgdir/usr/share/doc/cdm"
    install -Dm644 ../themes/* "$pkgdir/usr/share/doc/cdm/themes"
}
