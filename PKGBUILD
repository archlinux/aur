# Maintainer: Matthew Gamble <git@matthewgamble.net>

pkgname=bask
pkgver=0.10.1
pkgrel=1
pkgdesc="Bask in the convenience of a task runner for bash "
url="https://github.com/jez/bask"
license=("LGPL3")
arch=("any")
depends=("bash" "coreutils")
source=(
    "https://github.com/jez/bask/archive/refs/tags/${pkgver}.tar.gz"
    "bask"
)
sha512sums=(
    "d7146cf7419837d5c929c662fc1c2872865774b78efef065f2483b604490ddfbd4a8b8a1d8986683959b9201cf29d87c0296f2a5b6cbff2a4f05d44646f82fd3"
    "f76a150a03132727ae553757e1243a37efb89d1bdb0d3f9a9a664500b4afd7c9222fa9e9ac30fc20a502df20b730adf4879b8a1109d6ad04429cd207e41bf698"
)

package() {
    cd "bask-${pkgver}"

    install -Dm755 "${srcdir}/bask" "${pkgdir}/usr/bin/bask"

    install -Dm644 src/bask.sh "${pkgdir}/usr/lib/bask/bask.sh"
    install -Dm644 src/cli.sh "${pkgdir}/usr/lib/bask/cli.sh"

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/bask/LICENSE.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/bask/README.md"

    install -Dm644 completion/bask.bash "${pkgdir}/usr/share/bash-completion/completions/bask"
}
