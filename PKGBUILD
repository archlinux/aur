pkgname=alacrittheme
pkgver=0.1.0
pkgrel=1
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasonverbeek/alacrittheme/archive/$pkgver.tar.gz")
md5sums=(d70f9fbcb863d8f1374abff1eb1b86f5)

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -d "$pkgdir/usr/bin/"

    install -Dm755 bin/alacritty-mod "$pkgdir/usr/bin/"
    install -Dm755 bin/alacritty-theme "$pkgdir/usr/bin/"
    install -Dm755 bin/alacritty-font "$pkgdir/usr/bin/"
    install -Dm755 bin/alacritty-regenerate "$pkgdir/usr/bin/"

    install -d "$pkgdir/usr/share/alacrittheme/fonts"
    install -d "$pkgdir/usr/share/alacrittheme/themes"

    install -m644 fonts/* "$pkgdir/usr/share/alacrittheme/fonts/"
    install -m644 themes/* "$pkgdir/usr/share/alacrittheme/themes/"

    # install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/alacrittheme.bash"
    install -Dm644 completions/fish "${pkgdir}/usr/share/fish/completions/alacritty-theme.fish"
    # install -Dm644 completions/zsh "${pkgdir}/usr/share/zsh/site-functions/_alacrittheme"
}
