# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.3.26
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
b2sums_x86_64=('0ca8a207282d9fc8727385cd634d2b7b6e26659eb6df5033c885ec624904565448d9fb3023df0eb110d432cf61cae8a2b4496822365009fe0890ab33e2045925')
b2sums_aarch64=('566798c6ae72b26448a6ca082065685e7544ecd973a319efa37f9a6555847f077a175495d58fa7394693c5b08352a8a32142ec85746fd65933950f14a7e5c5f5')
b2sums_armv7h=('613646673dfc07e544506c88235846d9a72126b45025bea71c11c8c3af81927eb38347ffb7520ef35a717e616acc92e74482589ac0e0fbadba350a95d9822d25')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
