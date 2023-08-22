# Contributor: Bane Nicovic <banenicovic at gmail dot com>
# Maintainer:: Bane Nicovic <banenicovic at gmail dot com>
orgname="teams-for-linux"
pkgname="ms-teams-for-linux-bin"
pkgver=1.3.5
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
depends=("gtk3" "libxss" "nss")
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
sha256sums_x86_64=('d6e258b79fcfbad6498f27342778664e91c9c933d67d06dfba9f79e5e8b6f264')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 install -dm755 $pkgdir/usr/bin
 ln -sf "/opt/${orgname}/${orgname}" "${pkgdir}/usr/bin/${orgname}"
}
