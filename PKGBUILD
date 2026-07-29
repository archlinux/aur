
# Maintainer: Michał Walenciak <michalwalenciak@gmail.com>

pkgname=yay-llm-review
pkgver=0.1.0
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
sha256sums=('6f4507fd2cfdc7a85f0715be6b410661e0b93e538f45b4132c1e4aead795e335'
            'a9313b1ecaaecd6679ed6dd068bda7f89ed4e8ea60946d8338528f93e3e1833a'
            'feb4b25a5b7b6e9a2156d8a13d34a2d3ef13c3e43b726b6e8abf95dc91d2927b'
            '20a07638a7eb75047c81f5049181903d96a12a89f8b9dcb98ef5d00945471238'
            '604032830b9fa31fdb9af6a6d0bf772bdd37ca2158b33382f54afeee57c220a7'
            '03a41c975d8ac8bacea0031b60c721f4e17344ccc5144f7cdab66cd7140a32fe'
            '34cf43731b0fcfcb2322098d28a9c07329068c5fec45d6acd07304ae92ad3c90')

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
