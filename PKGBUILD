# Contributor: AlphaJack <alphajack at tuta dot io>
# Contributor: Asuka Minato

pkgname="teams-for-linux-electron-bin"
pkgver=1.1.8
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
depends=("electron24" "bash")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
sha256sums_x86_64=('b760bea426cff140b9bee68db820616ba8af1d733635d5402b8e3473f2c2016e')
sha256sums_aarch64=('48db26ba559e0f418a1ad5f033c8a4b3082b4bf1d818afa3dae89ead9548f477')
sha256sums_armv7h=('96b0836e1a077395dc3ec0936d3a33a6d1faad71beaa2b416fe7974d5623fc16')
options=("!strip")


package(){
 tar -xf "data.tar.xz" -C $pkgdir
 find "$pkgdir"/opt -type f -not -path "*resources/*" -delete
 find $pkgdir -name "*.desktop" -exec sed -i -r "s!^Exec=.*!Exec=electron24 /opt/teams-for-linux/resources/app.asar!" {} \;
}

