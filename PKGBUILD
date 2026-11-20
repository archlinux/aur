# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.32.1
pkgrel=1
pkgdesc='Unofficial Microsoft Teams for Linux client (binary version)'
url='https://github.com/IsmaelMartinez/teams-for-linux'
license=('GPL-3.0-only')
arch=('x86_64' 'aarch64')
provides=('teams-for-linux')
conflicts=('teams-for-linux'
           'teams-for-linux-appimage'
           'teams-for-linux-git'
           'teams-for-linux-wbundled-electron'
          )
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'nodejs')
source_x86_64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_amd64.deb")
source_aarch64=("$url/releases/download/v$pkgver/teams-for-linux_${pkgver}_arm64.deb")
b2sums_x86_64=('601d74a3333f77bc7008dddbd58b983ae61af949ea1fc76c618a2891689b047c63bac2d8ee26b62630ece38001ed50be83632c9e64f29c35fd865d8ace43ff2d')
b2sums_aarch64=('5cc35400a6fa847b15dc035326aa58fc6d992ca56248a2f9c25fae9aa3cfdb099c2403f43daaa30a9339cb97e7dad1211b81b8d050b7112a612d3882fdba3b19')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
