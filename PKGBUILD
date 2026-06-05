# Maintainer: MedCy1 <mederick.roge@gmail.com>
pkgname=wayinhibit
pkgver=0.5.0
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
)
sha256sums_x86_64=(
    'dff4a02edf8873e1e1dc5e367567f97f95351e9696e4e0930fa6ceffd9752898'
)
sha256sums_aarch64=(
    '6d9099ed31a7923580f041628e2635f74f891199f4b69a9e744c20f793721adc'
)

package() {
    install -Dm0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 wayinhibit.bash "$pkgdir/usr/share/bash-completion/completions/wayinhibit"
    install -Dm0644 _wayinhibit "$pkgdir/usr/share/zsh/site-functions/_wayinhibit"
    install -Dm0644 wayinhibit.fish "$pkgdir/usr/share/fish/vendor_completions.d/wayinhibit.fish"
}
