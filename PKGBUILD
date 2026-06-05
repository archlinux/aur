# Maintainer: MedCy1 <mederick.roge@epitech.eu>
pkgname=wayinhibit
pkgver=0.5.1
pkgrel=1
pkgdesc="A small Wayland idle inhibitor written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/MedCy1/wayinhibit"
license=('MIT')
depends=('glibc' 'gcc-libs')
source=(
    "LICENSE::https://raw.githubusercontent.com/MedCy1/wayinhibit/v$pkgver/LICENSE"
    "wayinhibit.bash::https://raw.githubusercontent.com/MedCy1/wayinhibit/v$pkgver/completions/wayinhibit.bash"
    "_wayinhibit::https://raw.githubusercontent.com/MedCy1/wayinhibit/v$pkgver/completions/_wayinhibit"
    "wayinhibit.fish::https://raw.githubusercontent.com/MedCy1/wayinhibit/v$pkgver/completions/wayinhibit.fish"
    "wayinhibit.1::https://raw.githubusercontent.com/MedCy1/wayinhibit/v$pkgver/man/wayinhibit.1"
)
source_x86_64=(
    "$pkgname-$pkgver::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-x86_64"
)
source_aarch64=(
    "$pkgname-$pkgver::https://github.com/MedCy1/wayinhibit/releases/download/v$pkgver/wayinhibit-aarch64"
)
sha256sums=(
    'c6f47d3c350962a79fc1501510e8e1cc8fbcc6502d8421505ba1b9fbd1ef6237'
    '487ae78d81aba7992879e608d7778cfe27313e53b6a32fc28baed17a75087973'
    '54ce8eb65d4c986dcbf5fff16752ebf00a59ffe4210adcfac3f3643221acd3ea'
    '9fde874e1d4133fab14a6df2b191d2a0d1687a4472963ca11ade6975e10625f1'
    '94c42eafdbee589be444d1ee0b72d9c31e882389884d4e0952e82ff46ce32e95'
)
sha256sums_x86_64=(
    '85f22294b2fcf9b9337e93434c4baf0f8ab22088f0851b85aa0afa25d192fc1e'
)
sha256sums_aarch64=(
    '4eda3383ed2ae627fd4cc8b416dc880cd0fce618e66855494ece490a5b431d97'
)

package() {
    install -Dm0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 wayinhibit.bash "$pkgdir/usr/share/bash-completion/completions/wayinhibit"
    install -Dm0644 _wayinhibit "$pkgdir/usr/share/zsh/site-functions/_wayinhibit"
    install -Dm0644 wayinhibit.fish "$pkgdir/usr/share/fish/vendor_completions.d/wayinhibit.fish"
    install -Dm0644 wayinhibit.1 "$pkgdir/usr/share/man/man1/wayinhibit.1"
    gzip -9 "$pkgdir/usr/share/man/man1/wayinhibit.1"
}
