# Maintainer: xiSage

pkgname=hitokoto-cli-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line tool to fetch hitokoto (yiyan) from hitokoto.cn"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/xiSage/hitokoto-cli"
license=('MIT')
provides=("hitokoto-cli=${pkgver}")
conflicts=("hitokoto-cli")
options=(!strip)

source_x86_64=(
    "hitokoto-${pkgver}-linux-x64.tar.gz::https://github.com/xiSage/hitokoto-cli/releases/download/v${pkgver}/hitokoto-linux-x64.tar.gz"
    "LICENSE-upstream::https://raw.githubusercontent.com/xiSage/hitokoto-cli/v${pkgver}/LICENSE"
)
source_aarch64=(
    "hitokoto-${pkgver}-linux-arm64.tar.gz::https://github.com/xiSage/hitokoto-cli/releases/download/v${pkgver}/hitokoto-linux-arm64.tar.gz"
    "LICENSE-upstream::https://raw.githubusercontent.com/xiSage/hitokoto-cli/v${pkgver}/LICENSE"
)
source_armv7h=(
    "hitokoto-${pkgver}-linux-arm.tar.gz::https://github.com/xiSage/hitokoto-cli/releases/download/v${pkgver}/hitokoto-linux-arm.tar.gz"
    "LICENSE-upstream::https://raw.githubusercontent.com/xiSage/hitokoto-cli/v${pkgver}/LICENSE"
)


sha256sums_x86_64=('c265ab870ead7c6b33c3380b7e1f2822d7b2df28d55351666f9c0c29140fd7bf'
                   'a9b606e32daf815bb801da0260e0a5fb83dfee31397db003c64a456e055778ed')
sha256sums_aarch64=('44d9bd650c3395a2d80a499197e5b56e37358f11f330fdd30c68fd0cf0a906d8'
                    'a9b606e32daf815bb801da0260e0a5fb83dfee31397db003c64a456e055778ed')
sha256sums_armv7h=('b6b0bf032577fe891b8cbc2acfb963b5d0407eb2ca2e566b9d820412fb4e07ba'
                   'a9b606e32daf815bb801da0260e0a5fb83dfee31397db003c64a456e055778ed')

package() {
    cd "$srcdir"
    install -Dm755 hitokoto "$pkgdir/usr/bin/hitokoto"
    install -Dm644 LICENSE-upstream "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
