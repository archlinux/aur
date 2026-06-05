# Maintainer: MedCy1 <mederick.roge@gmail.com>
pkgname=wayinhibit
pkgver=0.4.0
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
    'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
    'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
)
sha256sums_x86_64=(
    'e63e1bf780ae1e754957bbfde93a35761cc0013470d43a674f15f5ac76d75325'
)
sha256sums_aarch64=(
    'fb39f8d7da4670c82a993e4a486c0c827a5e89493b3c278970c9ea5146468eea'
)

package() {
    install -Dm0755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm0644 wayinhibit.bash "$pkgdir/usr/share/bash-completion/completions/wayinhibit"
    install -Dm0644 _wayinhibit "$pkgdir/usr/share/zsh/site-functions/_wayinhibit"
    install -Dm0644 wayinhibit.fish "$pkgdir/usr/share/fish/vendor_completions.d/wayinhibit.fish"
}
