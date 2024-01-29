# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teams-for-linux-bin"
pkgver=1.4.3
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
b2sums_x86_64=('b542b5f7373c0182986a9a848206a146fd674bb07f52b556ca6ee5bb7ede40520b03e90bd668435b61f0067deeeea1b86327b3a68469acc181aaaea52d94c34f')
b2sums_aarch64=('6647ff152f999c1982662bb7eedbcb9b4daf20b32aa7e9eb4327bf26fdc0be663a0ecab54eb321ca0c7314d4c2af4433e3c20b67330e7b556b0ffbd4e142debb')
b2sums_armv7h=('b9e042924579435013238853fb8ed6f011480454d0516e2999d372a2b54df2f14e2b1e03d3016b3c658e50d1491ba0a1c92affcd6cb891a0265f4373507a1f2a')
options=("!strip")

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
