# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.7.7
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
b2sums_x86_64=('e9ad75ef3ff5e74eb9915374e7723bc3f1dec7241c8296a887ec57f2f26f6c116ee9a0b84374d1ba8f4c57a72233dba90577442530e89d0989e0903142e68ff4')
b2sums_aarch64=('593d9b2eb66d380b7739cae9f2e0bb27713b3145a749c930493dc94dd78c641251d95ddecfd423317b14b8c6a54b914f9f2accbf82b3e83d8e555886e4a7b781')
b2sums_armv7h=('aa3f3376881914254b7700deff7f26e2f1e7f0734cb59fd830d4b617f099ba3939f20ad67471a296fb5959429dd9b05b3bdd91757f94795b2a96bdb123c85897')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
