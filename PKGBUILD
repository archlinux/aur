pkgname=alacrittheme
pkgver=0.0.1
pkgrel=1
arch=('i686' 'x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasonverbeek/alacrittheme/archive/$pkgver.tar.gz")
md5sums=(0459571855fd28a190778d2b2cc3227f)

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
