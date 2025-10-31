# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.7
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
b2sums_x86_64=('cf738389835354e0b39ac1216221d2deb607a3791d715a386d7772e37e77eb3756233b6227823e5b96403a073a2b879717b894e1add24638f86561ec1b928a7b')
b2sums_aarch64=('7dc1f7cebca157fce8d580a4f140c2020b672ca5ecce298ddbfd3b15d1e9de87530f7047ac739c32ab8eb9b4dd8f0afee7603f383f053acb7606074f3bb126f7')
b2sums_armv7h=('2fbba35c98fe3212ab6b3ca516ec331272559488c44974b800a35540f9145050afd6b6af7e6baccd753998a9d42c5bf1d5c6fb282c6c15ae12c9d9fd79399841')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
