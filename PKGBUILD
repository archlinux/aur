# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>
pkgname=yay-llm-review
pkgver=1.2.0
pkgrel=1
pkgdesc='Opt-in llama.cpp security review hook for yay AUR packages'
url='https://github.com/Kicer86/yay-llm-review'
arch=('any')
license=('MIT')
depends=('python' 'git' 'yay')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2c0426362b69416c7e7cc6a6d6042e51fc5a4a0d1c49e885a142db5ebe085e0a')

check()
{
    python "$srcdir/$pkgname-$pkgver/test_yay_llm_review.py"
}

package()
{
    install -Dm755 "$srcdir/$pkgname-$pkgver/yay-llm-review" "$pkgdir/usr/bin/yay-llm-review"
    install -Dm644 "$srcdir/$pkgname-$pkgver/hook.lua" "$pkgdir/usr/share/yay-llm-review/hook.lua"
    install -Dm644 "$srcdir/$pkgname-$pkgver/config.example.toml" "$pkgdir/usr/share/yay-llm-review/config.example.toml"
    install -Dm644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver/yay-llm-review.1" "$pkgdir/usr/share/man/man1/yay-llm-review.1"
}
