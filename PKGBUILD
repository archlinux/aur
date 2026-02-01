# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.2
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
b2sums_x86_64=('87f0c8e15c11f5d58136b7358fff279e3048530d003db2c8dd058d640a082abf9f72cb5982991b71ed7b9496289942f8c5eec0c2ebebdbe3f62c6c310e462b7d')
b2sums_aarch64=('78598857b03dba76312091e76b6927b4e875b99b107fb2a064c189c0629526b4462d5a2838e7f9f2bcb9a4aee05e1ef059adedf11cd63bc6d0d13f330dfd2ac9')
b2sums_armv7h=('316169aff0b7eeb249cb2afcacef0429f4d5874a44fd354268a62aec2f74ab32ffad5a1b08a4414961843b7f337763ac83b08be880bf11bfd53b41355f8d1330')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
