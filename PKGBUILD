# Maintainer: Goldbro233 <bowensun_06@outlook.com>
# Contributor: Ricky Morabito <codericcardo@gmail.com>

pkgname=tokscale-bin
pkgver=4.20.0
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
b2sums=('f81d3cfe1ed66c54452903ac08c24c11721e2f4c331200b4225083410ad4bae5775c9246b5bdf22e688da598cc58404482afeabcb2b398f82e510973114ec1a3'
        'b1bda54b1595c875bc2ef3d02acbc5f4371406bd5c21fb56ecef98b2bc8357baf56dd8908e6f1867f4f4bc5c8ceeb7900c01e9f6ca4e44f31721419baba32381')

package() {
    install -Dm755 "package/bin/tokscale" "$pkgdir/usr/bin/tokscale"
    install -Dm644 "tokscale-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
