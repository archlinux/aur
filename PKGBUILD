# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.6
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
b2sums_x86_64=('445d33a522e8d98b6383db01341c65c21c13a71c6b2d67db5fa2c18d0601988570d6ca8ae1ea43634c1520714d058cfe6047cd4e754a0f225fa766d6d38b205e')
b2sums_aarch64=('b3799ed3386a12b576b6b3a5dd7e18f2e34665db3d88a83403852e073afb36cb43db1329c379f6dbcec1b0c2ac133829f68347a17ddf86c569a57659ec2a869f')
b2sums_armv7h=('1f32c54b1a2c755bca0f82f1522f922f6e317798504d6381568017b1327d2839640185b9d2a683593ef268c86903b5d74b34b3416419999f42756d4ef370b068')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
