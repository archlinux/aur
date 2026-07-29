# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>
pkgname=yay-llm-review
pkgver=0.1.1
pkgrel=1
pkgdesc='Opt-in llama.cpp security review hook for yay AUR packages'
arch=('any')
license=('MIT')
depends=('python' 'git' 'yay')
source=(
    'yay-llm-review'
    'hook.lua'
    'config.example.toml'
    'README.md'
    'LICENSE'
    'yay-llm-review.1'
    'test_yay_llm_review.py'
)
sha256sums=(
    'da75b3c5d44553e8684caf8e41ce28323e8b1bdfa39e7f9f7f1f62b448c14e38'
    'a9313b1ecaaecd6679ed6dd068bda7f89ed4e8ea60946d8338528f93e3e1833a'
    '1ab4a36ac69cdfd4327ad202b2fbcf0b8eab7ccd33f0f3babf84e77df1ab552e'
    'e1e10af84180ea30206ba5e1cb773c53bcc8454f7689052efb64884ca404924e'
    '604032830b9fa31fdb9af6a6d0bf772bdd37ca2158b33382f54afeee57c220a7'
    'f8fb22ae485bde911fbf2eb344aa6e25ba70ab89c2513bc251acf93b7a92e998'
    '34cf43731b0fcfcb2322098d28a9c07329068c5fec45d6acd07304ae92ad3c90'
)

check()
{
    python "$srcdir/test_yay_llm_review.py"
}

package()
{
    install -Dm755 "$srcdir/yay-llm-review" "$pkgdir/usr/bin/yay-llm-review"
    install -Dm644 "$srcdir/hook.lua" "$pkgdir/usr/share/yay-llm-review/hook.lua"
    install -Dm644 "$srcdir/config.example.toml" "$pkgdir/usr/share/yay-llm-review/config.example.toml"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/yay-llm-review.1" "$pkgdir/usr/share/man/man1/yay-llm-review.1"
}
