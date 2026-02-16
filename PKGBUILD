# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.5
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
b2sums_x86_64=('24bc91aec9b4acc445bd53d881091428414aa69407fea2c8038ab182f6a0fb0dece39cba710f710c6ada4e30af2b6d8b2fe0415b7040ae542e9ccb876b7634f8')
b2sums_aarch64=('72a6f9af2743414006b7b8e84659f825ae6f960f8923d7ee5414e098cbfcc5043bbe20133d4050b71bfd8ad187696e443db882d7bba67201cf43685b12d88553')
b2sums_armv7h=('58acde6cca1bd72c99d00749927edfd2f6e0a3b60f42ed7bfd583c5e79dd0c9996c63d4b9b3278401b34b44862881aa3e679e92b09e25c2442e073f2c0a7cc59')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
