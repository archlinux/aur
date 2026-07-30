# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>
pkgname=yay-llm-review
pkgver=0.1.1
pkgrel=1
pkgdesc='Opt-in llama.cpp security review hook for yay AUR packages'
url='https://github.com/Kicer86/yay-llm-review'
arch=('any')
license=('MIT')
depends=('python' 'git' 'yay')
_commit='e068b40c20f647a8825f394e5e2e91c09e1c5423'
source=("$url/archive/${_commit}.tar.gz")
sha256sums=('26cc83fbd3abb2ec6dea0caee15ee75483d4a3d20c27bc0c7b19721775a2209f')

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
