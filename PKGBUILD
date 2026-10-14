# Maintainer: jinzhongjia <mail@nvimer.org>

pkgname=fcitx5-themes-candlelight
pkgver=1.0.0
pkgrel=1
url='https://github.com/thep0y/fcitx5-themes-candlelight'
pkgdesc='fcitx5的简约风格皮肤——烛光'
arch=('any')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('570e1de552922d678f747c491d7bff2f1d6afc0a337d7771da9129346c68d152')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -dm755 "$pkgdir"/usr/share/fcitx5/themes/
    # ponytail: install every dir that has a theme.conf instead of listing the
    # themes by hand — upstream adds variants (e.g. macOS-{light,dark}-png) and
    # a hardcoded list silently drops them.
    for _theme in */theme.conf; do
        cp -r "${_theme%/theme.conf}" "$pkgdir"/usr/share/fcitx5/themes/
    done
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
