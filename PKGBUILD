# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.13.0
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
b2sums_x86_64=('df0b700014ea1718e1faf561ce21531cea37ae4372c8bcaa120d5b79158ca9a0215086f3267b6c2f978e83be0058c9054687edba52aff4c86251c71cc759a536')
b2sums_aarch64=('05a315b7ba42aed723c9ddc662a06ccbbdca91b62e9ea212018730fd44ebb52e521c47703df4db0461a80427570171912c7d0f2fcfd6b5486191ec93c6546516')
b2sums_armv7h=('7290e14744bc0e0480c7c320186a99a49dafc7262607b8f1f62f8313abd2cb483aea4e625ba715ec821dd993aa7bfc08634795e1e936b364b0064ba7c3e147eb')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
