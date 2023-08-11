# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.3.1
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
sha256sums_x86_64=('1533455f8b75a439fa1843d0d0108f284f6d87271c04dcbe5de3bfcd547523c0')
sha256sums_aarch64=('4a415a3128149a92323978e50f1a5ad220fc2667a8ec521c5d3ef2f66dd1f9c3')
sha256sums_armv7h=('284a4b4e0a3e3131c5859350a52cb5801cf08185275c8a277747bc7304194930')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
