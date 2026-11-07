# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.28.0
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
b2sums_x86_64=('dcf8b5a85f596dba4e2afb784acc3bfffc9e2561519cce77ee13e934562d63e7ac83fe2e7046469175266cffda62698afccf0f55db470c4844d4b8b31cda9ec5')
b2sums_aarch64=('ed5df4354b25a8fb7b33192e2ac7f4b684e8d31dc135760fbb22370cbe89d0617bfb41905ef4432238b4fb755e9c1dc7759b147131898d06397d2e2920a10020')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
