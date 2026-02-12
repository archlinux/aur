# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.3
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
b2sums_x86_64=('2e9a8af135bd951e6049089432371908d30d814aa3984b44bb7b1b3e2fbfc7244c1db97f5914117fb15f9928e6acd91fb3f55fcb0cfd1008742414a839a3696e')
b2sums_aarch64=('57542e204325268ad737a011eab76e3b800e2a87da30a515ec5c20c723f25f57ee296e3ee70c6e468b17f0ffd2da698a0f7e1d1eabbd0dee979e6c2000f6ef60')
b2sums_armv7h=('b536ceb23c108eb57280b103f58c0c8ccafbeaa765e2cc54e693d16b5976e7a87584f765e125d0fe8fb4a1ccfe8766982b90bbc71d43dd35f1900423096b7ede')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
