# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vim-prosession
pkgver=0.7.5
pkgrel=2
pkgdesc="Handle Vim sessions like a pro"
arch=(any)
url="https://github.com/dhruvasagar/vim-prosession"
license=(Vim)
groups=(vim-plugins)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        LICENSE-VIM)
sha256sums=('c928480341b152cfcde58f3a4848bba373b5bb7df7bb87e1f75ea3e8fefc5a68'
            '9f0c174a1ebb45f10904046523392104aee46841a90f1508578da86011a6a1ba')

package() {
    depends=(vim-plugin-runtime vim-obsession)
    cd "$pkgname-$pkgver"
    find autoload doc plugin rplugin t \
      -type f -exec install -Dvm644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
    install -Dvm644 "$srcdir/LICENSE-VIM" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

