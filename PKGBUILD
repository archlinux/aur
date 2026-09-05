# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.20.0
pkgrel=1
pkgdesc='Unofficial Microsoft Teams for Linux client (binary version)'
url='https://github.com/IsmaelMartinez/teams-for-linux'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64' 'armv7h')
provides=('teams-for-linux')
conflicts=('teams-for-linux'
           'teams-for-linux-appimage'
           'teams-for-linux-git'
           'teams-for-linux-wbundled-electron'
          )
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'nodejs')
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
source_armv7h=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_armv7l.deb")
b2sums_x86_64=('b760e0e895a8151cfde608de63a01b126bebb2df01b40ca183e0385abb66375dda7dcb88aa691980bdbb15cadb3a32ac1f82b788849b3d679d8a3197b5a46e05')
b2sums_aarch64=('b9d627a9f5ad551dfc1fabe380b58f42b82dbcc80bb18162f42addfc89a8148ae05399cc9025c7d6daf1d41024c92f40737b5e646820f0a99f614a0fcc7b8e53')
b2sums_armv7h=('23e3d647b4953b6966fe9c01cbfad14121c9d51cac0de163bb2108f956c9244325997a3b6827bf315549de7096aeb1b68b9760e9a0aea26d7dc70862b1b21989')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
