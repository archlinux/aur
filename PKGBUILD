# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.9
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
b2sums_x86_64=('3dbbb0f7a0654a6ffde9cd2216da4857aec8b3a92a4f670b10bf8de19bee96e4a9a824919556af050d8eaa58f7ee8a09c0de9c9585a7e2d86344b67405bdca96')
b2sums_aarch64=('aad411ea34808723230b15f0562a96272edfd0e965127460e726b333528cbdb17a6c8678c089aafb05d66c13970dcd4d0ccf8101628441c3e592bb961c382c63')
b2sums_armv7h=('92a04c67bf7c5cef8f24669fe557b29bca6371393ac878cd0008c5b8c5114cfd451f4af86d3b1ac1435ffa83d91fcc569c08d95a228b132da6123569b58c6f21')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
