pkgname=ttf-apple-fonts
pkgver=1.2
pkgrel=1
pkgdesc="Collection of official SF Pro, SF Display, SF Mono Apple Fonts"
pkgbase=ttf-apple-fonts
arch=('any')
url="https://github.com/gxanshu/otf-apple-fonts"
license=('GPL')
makedepends=('unzip>=6.0')

source=("https://github.com/gxanshu/otf-apple-fonts/releases/download/Fonts/fonts.zip")
sha256sums=('8a6d9d53019aa52c1b7be6c0a07cadbc0ff9929d3b8945f7fcee9ee519d900fe')

package() {
    cd "$srcdir"
    mkdir -p "$pkgdir/usr/share/fonts/apple-fonts"
    cp fonts.zip "$pkgdir/usr/share/fonts/apple-fonts/"

    cd "$pkgdir/usr/share/fonts/apple-fonts"
    unzip fonts.zip
    rm fonts.zip

    find . -type f -name '*.otf' -exec install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
}
