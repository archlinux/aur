# Maintainer: j4y <278006118+j4y-w4lk3r@users.noreply.github.com>
pkgname=cfr2-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Cloudflare R2 CLI: encrypted push/pull, keyhole/OpenBao secrets, trash, checksums, yazi plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/j4y-w4lk3r/cfr2"
license=('MIT')
depends=('age')
optdepends=('gnupg: --enc gpg' 'fzf: yazi browser' 'yazi: file manager plugin')
provides=('cfr2')
conflicts=('cfr2')
options=('!debug')
source_x86_64=("cfr2-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/cfr2_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("cfr2-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/cfr2_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('6e432ea6810a3631f268622b17873d0e551f59e35d39c78b0c2374c7b36a38ae')
sha256sums_aarch64=('51f0052fcf421d038e20a41fbca1b79138cf593b9895de0387f40d36f26dbd9a')

package() {
    install -Dm755 cfr2 "$pkgdir/usr/bin/cfr2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config.example.toml "$pkgdir/usr/share/cfr2/config.example.toml"
    cp -r plugins/cfr2.yazi "$pkgdir/usr/share/cfr2/cfr2.yazi"
}
