# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.4.12
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
b2sums_x86_64=('38c73e589838dd09549a11ce8c2c2f22e37119ca77272aa8ce50ec0df098d0a321b2e4691f3c04b533fdc75b7db020044c9f2a5aa59eee43b0fde8562e5b0122')
b2sums_aarch64=('6ec94bd3a6f7e036df9058ebb33a04a2fa91dd9c27d1f83234012073a96738b0217a7afdfb59b94109833750b152b695a89df7b80c648b753407961bc712fada')
b2sums_armv7h=('3ec369bda46f89ec66b44ad7a10ba111b7169be1192a6df3667a404bd139019647c724a71a9db1910ab06a305f2cb8e237f338e8698a085784385a3cc7df723f')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
