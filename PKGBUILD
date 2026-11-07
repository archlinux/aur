# Maintainer: j4y <278006118+j4y-w4lk3r@users.noreply.github.com>
pkgname=cfr2-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Cloudflare R2 CLI: encrypted push/pull, keyhole/OpenBao secrets, trash, checksums, yazi plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/j4y-w4lk3r/cfr2"
license=('MIT')
depends=('age')
optdepends=('gnupg: --enc gpg' 'fzf: yazi browser' 'yazi: file manager plugin')
provides=('cfr2')
conflicts=('cfr2')
source_x86_64=("cfr2-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/cfr2_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("cfr2-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/cfr2_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('7e38d33fd2a537fb08f6fb682786d8f76c356adebd44d611eb99bda00d0aeb1d')
sha256sums_aarch64=('fb5d073516591bb3db926314903eb6e723e5accb5351eb2a322475ae4ceb3ff6')

package() {
    install -Dm755 cfr2 "$pkgdir/usr/bin/cfr2"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 config.example.toml "$pkgdir/usr/share/cfr2/config.example.toml"
    cp -r plugins/cfr2.yazi "$pkgdir/usr/share/cfr2/cfr2.yazi"
}
