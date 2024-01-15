# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.4.1
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
b2sums_x86_64=('e8e5bb8130e0c6276649d5146412126c475263253b160c1f6f92d25052836aff2b4102ee71c3ef277d54fb3b0cba34788fe993ca5bba36a40c8597fb48ce5de4')
b2sums_aarch64=('ef98d2a290ed9d8ef7c823818ee7b78f7c23c9c64f61de1f4960a7d75d578d480dc25855e03c63d7fa9374ed45954eef737a84c6157ec95167bf34c2c5773e5d')
b2sums_armv7h=('ecd2c124a9b7a8f31321243c3b006ed9522b3067443623fc90dab067addae44d7381e87605c11d4abfa5ee6e2704b240d8b763607bb36b0188813f2ec2731bbb')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
