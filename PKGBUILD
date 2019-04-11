# Maintainer: Giusy Margarita <kurmikon at libero dot it>

pkgname=korla-icon-theme
pkgver=1.0.3
pkgrel=2
pkgdesc="Korla icon theme suitable for every desktop environment, dark and light versions"
arch=("any")
url="https://github.com/bikass/korla"
license=("GPL3")
depends=("gtk-update-icon-cache")
optdepends=(
    "hicolor-icon-theme: fallback Freedesktop.org Hicolor icon theme"
    "breeze-icons: fallback Breeze icon theme"
    "gnome-icon-theme: fallback Gnome icon theme")
install="$pkgname.install"
source=("https://github.com/bikass/korla/archive/v$pkgver.tar.gz")
md5sums=("a52a1b62ed2dbed2223ea0ec41a97370")

_iconpath=usr/share/icons

package() {
    mkdir -p "$pkgdir/$_iconpath"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

    cd "$srcdir/korla-$pkgver"
    cp -drf --no-preserve=mode,ownership "korla" "$pkgdir/$_iconpath/korla"
    cp -drf --no-preserve=mode,ownership "korla-light" "$pkgdir/$_iconpath/korla-light"
    cp -drf --no-preserve=mode,ownership "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    cd "$pkgdir/$_iconpath"
    mv "korla/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    rm -f "korla/create-new-icon-theme.cache.sh"
    rm -f "korla-light/create-new-icon-theme.cache.sh"
    rm -f "korla-light/LICENSE"
}
