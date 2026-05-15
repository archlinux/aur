# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.9.0
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
b2sums_x86_64=('1d0bf6ea2eba5b4a674a64c84546b00331682c3516d7a9efc069e28c941aa2053dd783e0a23fbdfd011a3f55745da71ec0ccd89722938c466d8f03a4f106609b')
b2sums_aarch64=('af7acf8fb0271c115c5aa0d4f8ff3f2d679c6d67e2a8f85646fb8c3c6a497c572fc9abe9619a03cfe46f8079b0ac77fccbe09813705099d2bb90bef1999ba6c8')
b2sums_armv7h=('ab4e57ceb2db18fb907bbac39dc2dba24bb264f301ab917fabc2eaf6a13f78523243388eb1154032dff2b481a9d87bcc2b5b887d95153ca92dc03ddac4b04d89')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
