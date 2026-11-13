# Maintainer: Goldbro233 <bowensun_06@outlook.com>
# Contributor: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-bin
pkgver=4.22.1
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
b2sums=('5157accc3872abddba27420835a1ff158cc6766ca97f5b2582734f03e2a82888d20a45133df0be57da3a76a2189ff87ce0d276ad9358b702a3345a9cc2022cb8'
        'b1bda54b1595c875bc2ef3d02acbc5f4371406bd5c21fb56ecef98b2bc8357baf56dd8908e6f1867f4f4bc5c8ceeb7900c01e9f6ca4e44f31721419baba32381')

package() {
    install -Dm755 "package/bin/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 "tokscale-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
