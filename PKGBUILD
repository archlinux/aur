# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.15.0
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
b2sums_x86_64=('696d7390e6e705f8f1778c0b2a412d18f6d41c626b8b65e87cc7a0b2e2c22624b0f71e2edc652bded02d88c327bb4f931592130682b688bdef44492a051361d6')
b2sums_aarch64=('4070d52533acc92bb028778fe1a3fd6ca91596e4081c8f809e18a52b38b6f486f248f29c7c4c91fbb0f84a7f820d3f3f7bd611fe340688f3b85fdf116bc273ce')
b2sums_armv7h=('0ce18c359d8dca9f7feb9b68eb873d0d3cf2586fc0521a281c85353253063b2dcc4be7247fe62101541c1a04b7e93206d1f55bcb838327499b2b292c52f891a1')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
