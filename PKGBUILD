# Maintainer: Goldbro233 <bowensun_06@outlook.com>
# Contributor: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-bin
pkgver=4.17.0
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
b2sums=('4884273ede4a4d480bcf48ae01f4fe33f4bff7c6cc6142379ff9900e430b84608aa16559880d57780cd875050f13df5e01410ad1f99d6ef9a66e7575d8603ae9'
        'b1bda54b1595c875bc2ef3d02acbc5f4371406bd5c21fb56ecef98b2bc8357baf56dd8908e6f1867f4f4bc5c8ceeb7900c01e9f6ca4e44f31721419baba32381')

package() {
    install -Dm755 "package/bin/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 "tokscale-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
