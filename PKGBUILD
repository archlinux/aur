# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.4.10
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
b2sums_x86_64=('b50ce6cae18dce9e3319ec064dd0cc1ac268ea05bea0f9b4fba708f76ebbf85fa8cbfe4a2fa9adac054317809f45561fe53de9bafd12291434206832a0d6a4c1')
b2sums_aarch64=('c63b1b578b9b522afed68ffc64b38a34f5da71c47500c28bf0fa6cc6033bc9846baaeaa2351af7bb0a20f9303043d36f91344423c83b4c7f03f30ca701629ef9')
b2sums_armv7h=('bae00f52d182c45ded26c10baa789d58442667945e9a2a20bd36c58633c2c988ef9d04244301dc3b823de277fe0f91c64f3a8b4e54724e67f3a6c9d508bb972b')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
