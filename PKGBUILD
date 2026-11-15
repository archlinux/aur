# Maintainer: Goldbro233 <bowensun_06@outlook.com>
# Contributor: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-bin
pkgver=4.23.0
pkgrel=1
pkgdesc='CLI tool and TUI for tracking token usage and costs from AI coding agents (prebuilt binary)'
arch=('x86_64')
url='https://github.com/junhoyeo/tokscale'
license=('MIT')
depends=('glibc')
provides=('tokscale')
conflicts=('tokscale' 'tokscale-git')
options=('!debug')
source=("tokscale-v$pkgver-linux-x64-gnu.tgz::https://registry.npmjs.org/@tokscale/cli-linux-x64-gnu/-/cli-linux-x64-gnu-$pkgver.tgz"
         "tokscale-LICENSE::https://raw.githubusercontent.com/junhoyeo/tokscale/v$pkgver/LICENSE")
b2sums=('eda1301596d3ecfc81e8233a78ffeb999e30c4323d03cceb39b411741d799a1a668b3b874d5e648f6d8caec45bf02ec1d67e802f99ee77c6987cf7fad47dc6bb'
        'b1bda54b1595c875bc2ef3d02acbc5f4371406bd5c21fb56ecef98b2bc8357baf56dd8908e6f1867f4f4bc5c8ceeb7900c01e9f6ca4e44f31721419baba32381')

package() {
    install -Dm755 "package/bin/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 "tokscale-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
