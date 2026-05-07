# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.8.0
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
b2sums_x86_64=('86e80844b0d43115439b19d2be90172f98c0b66bdf06647b2e38433ac2419dfbb2fc95c3dccd0b6ebfc7ad5fd836c6eaf37459b660ba0390afc5e7c7df8d2f59')
b2sums_aarch64=('71d514cbbd5c9ba737c841c4ea60ab6a26fb6e897639ddad49ef35bfde257564a2f8472d554d865e7c301cf10932a8759eadfcdd5963f671d7723e2d6ff3c100')
b2sums_armv7h=('ace6ee2ae950b3caa8dd95887d521233ecb1577a5e2cd835a15a57285f2c83b7a41ab2b47ced0fa3815cf7333743687592688a912b8d8a6f2fd36f75fed84096')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
