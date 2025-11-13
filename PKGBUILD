# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.12
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
b2sums_x86_64=('7ab2cb354496682993ad297ef32b6c92570a1c31e7e0305fde30325964221c5901b03e5bd9bec824c1057f47f21ea33b399148020f2c78d9ce52f619dbb8614b')
b2sums_aarch64=('fc935728517d0d9eda24bd4c500efde295f6580fde21a08dda67a50b1ea747da372517e2be040593a515863fcac6675784a85dce6832b07418d79d64c30f6fe5')
b2sums_armv7h=('a2b08eca3f8f64853893a7ba380ab49319ae6b01ca99f5f91c6a64d6db69367a33a7c67a45ba16cb027af05b6010bfd1e77429c61cb558aa8bf0dbd965702702')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
