# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.12
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
b2sums_x86_64=('073ddc34e0162dd7588f952d5d008c025b8a4eab37c298a1bd657777ed060226100a74c03ba71dd74d7aad0c01c4e2d2cba136202fea55a0bb597b1d2e905889')
b2sums_aarch64=('41cca510c9c2886fe7f72f041e755b245ccb96700689991c6e371be888e3599af6970b218798c6becc891396f343e5cdc38459ee35b6509a3051e6d297954cf8')
b2sums_armv7h=('77775441207fd385ed16f3c5b33060ddcbfd6154514116f995f824a2efa1a86f7bebdd715385786bd8227f09196bb357a677e68a5596c0e1435f9c61e1fa9c65')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
