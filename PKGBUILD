# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.3.22
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL3")
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
b2sums_x86_64=('a87c2aa079dab54404a7d6fc0c0416cb148e683a007061a50dbcb49fc1bf6061d824af6bf833b9af723630ada93fba40711a63d62e777324f6f4c35c98e339fa')
b2sums_aarch64=('fae478ff58fb93c6ee3ad8980cf07a761210d857c90fcb3419083a994a7b40e188de3b35c7f32ae2f815a44816e2b3a60f6b5b26c76ebb566101dd8df2e309c4')
b2sums_armv7h=('1fa37243ef11c833aa5c133bad84f86410b82d0c93c069a0ef40760b582202181bb5171b8b3445672f9c73ac06fb1f31bfdd9967ad4bc09dd39f09cc863548a7')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
