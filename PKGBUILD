# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.14.1
pkgrel=2
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL-3.0-only")
arch=("x86_64" "aarch64" "armv7h")
provides=("teams-for-linux")
conflicts=("teams-for-linux"
           "teams-for-linux-appimage"
           "teams-for-linux-git"
           "teams-for-linux-wbundled-electron"
          )
depends=("gtk3" "libxss" "nss")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('a62abd9ee039d36f15d2d641298e7bd6d2602eebfed8ae659e4c9c01ccae55faf9e56ac9240e05bac072de47c4ef22beb98f0ead08bc93b9efd22d10504e2e03')
b2sums_aarch64=('05ae1e169949e33de5b78010867fef749fd058695cbb378209125931be166d52925cd8329b8ebe7c10e5145766601c16ac0d93c8b5821167cabe2c4685499557')
b2sums_armv7h=('eb1470b1f5576eeb6e401b137153ed0f5dd2301b80731fede39f595a138b77076ca9a5594a6e321a01b69f2b8935e5a5062e147ed1c1baf8aa253ad5fe979cd8')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
