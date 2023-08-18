# Contributor: Bane Nicovic <banenicovic at gmail dot com>
# Maintainer:: Bane Nicovic <banenicovic at gmail dot com>

pkgname="ms-teams-for-linux-bin"
pkgver=1.3.3
pkgrel=1
pkgdesc="Unofficial Microsoft Teams for Linux client (binary version)"
url="https://github.com/IsmaelMartinez/teams-for-linux"
license=("GPL3")
arch=("x86_64")
provides=("teams-for-linux")
conflicts=("teams-for-linux"
           "teams-for-linux-appimage"
           "teams-for-linux-git"
           "teams-for-linux-wbundled-electron"
          )
depends=("electron25" "bash")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
sha256sums_x86_64=('b3b3fc78c3564d2ebe20a4a5f6cd42c29f47cfb50074ebc3baca187301e001c3')
options=("!strip")

package(){
 tar -xf "data.tar.xz" -C $pkgdir
 find "$pkgdir"/opt -type f -not -path "*resources/*" -delete
 find $pkgdir -name "*.desktop" -exec sed -i -r "s!^Exec=.*!Exec=electron25 /opt/teams-for-linux/resources/app.asar!" {} \;
}




