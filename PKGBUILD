# Maintainer: Goldbro233 <bowensun_06@outlook.com>
# Contributor: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-bin
pkgver=4.23.1
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
b2sums=('956514515881cf6352a939bd2ae682d668506e4d687de9adb20a8cc0c2ecfc9f96d484419174892ad0bc6b40f5739d599b8276e6ff22f982c3ff32dfa0f4eb95'
        'b1bda54b1595c875bc2ef3d02acbc5f4371406bd5c21fb56ecef98b2bc8357baf56dd8908e6f1867f4f4bc5c8ceeb7900c01e9f6ca4e44f31721419baba32381')

package() {
    install -Dm755 "package/bin/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 "tokscale-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
