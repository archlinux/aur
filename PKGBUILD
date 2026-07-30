# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>
pkgname=yay-llm-review
pkgver=0.1.1
pkgrel=2
pkgdesc='Opt-in llama.cpp security review hook for yay AUR packages'
url='https://github.com/Kicer86/yay-llm-review'
arch=('any')
license=('MIT')
depends=('python' 'git' 'yay')
_commit='05ff3d136119f2fef46c3bc80e4c54270cd677d2'
source=("$url/archive/${_commit}.tar.gz")
sha256sums=('c142dc6d31261c7614bc21b8a88296ca6f2325f15dbedde40aaf9c30b5ede33f')

check()
{
    python "$srcdir/$pkgname-$_commit/test_yay_llm_review.py"
}

package()
{
    install -Dm755 "$srcdir/$pkgname-$_commit/yay-llm-review" "$pkgdir/usr/bin/yay-llm-review"
    install -Dm644 "$srcdir/$pkgname-$_commit/hook.lua" "$pkgdir/usr/share/yay-llm-review/hook.lua"
    install -Dm644 "$srcdir/$pkgname-$_commit/config.example.toml" "$pkgdir/usr/share/yay-llm-review/config.example.toml"
    install -Dm644 "$srcdir/$pkgname-$_commit/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/$pkgname-$_commit/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$_commit/yay-llm-review.1" "$pkgdir/usr/share/man/man1/yay-llm-review.1"
}
