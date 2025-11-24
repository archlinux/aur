# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=2.6.16
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
b2sums_x86_64=('6283944bad6d9c1728cc9b821d3fd94c41d500925baf5523ad09f77ec714c471ad43a83545ab8590a930ff8c80902d557fc18f8d0ca274607dd811f4952794a1')
b2sums_aarch64=('4f7342c3dcc249eacce3726b7309612ebcbdd5f5f22554dce0b8ec1f1ecc7efabb9761b1a108351590d25e386fdb64dc151438dc6aa6553fd2b69d7e3f3f5ffe')
b2sums_armv7h=('fa1aa56bab0e7e7b23c01cdd9fd9998811888a742da62f92ecda47a5c74832e78ddce8b426da253b4fed9b00206e7aa24a11e93e153a46345ee62157c4e32251')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
