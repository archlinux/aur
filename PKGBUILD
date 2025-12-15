# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.18
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
b2sums_x86_64=('fc3097eda1f28c1dfc40e499a08430d1027ea77ccdc44690f6e8c2557b4013018e37c9ca83bd9a07d6bbb11406cb7d0109ca9d93bc1c59ed3a7b450d77881e95')
b2sums_aarch64=('434f3e287ec5a3f40c650fb5a5fe1db114a68ab757b96e9d3f6a3a2847f316d379bd422e149a1070e06a2261dbeaa740cd558179be312fb03429d4c30eed197e')
b2sums_armv7h=('a8f452cb2f1f0590f5de2f7d147882cee315d206b1d6a42adb5337acecd77c36024e03444e43b5180d920cced034c408a0366cd7d0aea7f318531b0791f847b8')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
