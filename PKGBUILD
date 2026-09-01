# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=lockenv-bin
pkgver=0.1.8
pkgrel=2
pkgdesc='Simple, password-based encrypted vault for .env and infrastructure secrets'
arch=('x86_64' 'aarch64')
url='https://github.com/illarion/lockenv'
license=('MIT')
provides=('lockenv')
conflicts=('lockenv')
source=("${pkgname}-${pkgver}.LICENSE::${url}/raw/master/LICENSE")
source_x86_64=("${pkgname}-x86_64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/lockenv_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-aarch64-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/lockenv_${pkgver}_linux_arm64.tar.gz")
sha256sums=('e962dd9a243a633210cf44d96cce779d73637121ca8a684548d18221b7eff093')
sha256sums_x86_64=('da05295122e767d4ea29a02fb1a91b0e7582e4fd7a1d407a827bde9cfe5560d4')
sha256sums_aarch64=('84c64794afb3568cba70818df8bb48dc214e2e644d1cf5c959fecb6b6c102510')

package() {
    install -Dm755 lockenv "$pkgdir/usr/bin/lockenv"

    install -Dm644 completions/lockenv.bash "$pkgdir/usr/share/bash-completion/completions/lockenv"
    install -Dm644 completions/_lockenv "$pkgdir/usr/share/zsh/site-functions/_lockenv"
    install -Dm644 completions/lockenv.fish "$pkgdir/usr/share/fish/vendor_completions.d/lockenv.fish"

    install -Dm644 "${pkgname}-${pkgver}.LICENSE" \
        -t "$pkgdir/usr/share/licenses/$pkgname/"
}
