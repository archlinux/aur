# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.8
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
b2sums_x86_64=('0b522552426acb392bff5a205eb95b6ee7926743799bb209437113fc72041ca22b9f6eb506d8527994bb9ef4e3cf74362b4195f9cf5fb8cd21f4e11a327d2afe')
b2sums_aarch64=('4f9dace5151099dd57a21ac5213579d22940f6a26e97551ed38be876fd44a3a994f4ba90656f2c83768c3cf2d9c1bd7865d55f04714538f71881e854d6ff67b3')
b2sums_armv7h=('b555e9789c4430352349e7ea5f870a8fdec2377fdccd5f7692833adca8865cf7092b92c5c2a6e1618ba67711bae211d2258ee7cf250bb0523a4669e93beed9a4')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
