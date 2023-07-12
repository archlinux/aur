# Maintainer: Daniele Basso <d dot bass05 at proton dot me>

pkgname='corepacker'
pkgver=0.0.0
pkgrel=2
pkgdesc='Remove npm, yarn and pnpm using corepack'
arch=('any')
url='https://github.com/nodejs/corepack/'
license=('')
source=("corepacker-enable.hook" "corepacker-disable.hook"
		"corepacker-npm.hook")
sha512sums=('183242451c81fec324afcab2d2d0ad2cbaa93e987c899a0a8cc3846cc2d38a85ec544d2560e252bccf7dfc3cfb94a93dfe279bf2b59d3c20d6d0efa6bdedcbda'
            '963becf46acf06e7560e02f96dbca9ca095629394317cc4c1cf1f80397aa564ad4807352ba32a28f891c6520535e1f7b71556571d44d0f22aef55c992a0e0136'
            '7d1177924600391c07f5e2f69537cd554629afa65a0131577c3fb1d29b4affaf9d3bd5222fdefa02c60f9f3447b15e0f5c90e17f3669031e6a35408357b0f171')
provides=("npm" "yarn" "pnpm")
conflicts=("npm" "yarn" "pnpm")
depends=("nodejs")

package() {
  install -D -m0644 -t "$pkgdir"/usr/share/libalpm/hooks *.hook
}
