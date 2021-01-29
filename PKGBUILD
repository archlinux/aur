pkgname=alacrittheme
pkgver=0.0.3
pkgrel=1
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasonverbeek/alacrittheme/archive/$pkgver.tar.gz")
md5sums=(63e7a18a3ea9bf12cf0cd783ec005cf3)

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 -t "$pkgdir/usr/bin" "bin/alacritty-mod"
    install -Dm755 -t "$pkgdir/usr/bin" "bin/alacritty-theme"
    install -Dm755 -t "$pkgdir/usr/bin" "bin/alacritty-font"
    install -Dm755 -t "$pkgdir/usr/bin" "bin/alacritty-regenerate"

    install -d "$pkgdir/usr/share/alacrittheme/fonts" 
    install -d "$pkgdir/usr/share/alacrittheme/themes"

    install -m644 fonts/* "$pkgdir/usr/share/alacrittheme/fonts/" 
    install -m644 themes/* "$pkgdir/usr/share/alacrittheme/themes/"

}
