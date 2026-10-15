# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.24.0
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
b2sums_x86_64=('9e460b2e9e455f97dd4075082388675d7c4a4e5ebecffd798d10e6fd5df5397d47cfbccbd071f032a0c9e22ee1ab6cae29b0ff7063028167870e02c9b999601e')
b2sums_aarch64=('19ae6a067a46d04f6b23febf0c6f75e3ba9ffd163323544eaf3feeed299dbc4282489a9a5291a28e4cb494da275a3359bbe3a97315fa7148e00f9724cd98ba78')
b2sums_armv7h=('5fafddc259b3d4279e3f124e696079c4c063fb092d97c5262af929190573477e184b3cd79d2740f210228636d96210ae27dddb1c03e14d8c463d49e08e08d52e')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
