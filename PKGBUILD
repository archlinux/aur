# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.16.0
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
b2sums_x86_64=('919dceb273d4cf9b8528266bc35b5d8fbfb5c9018ecf3ec6498b3b88534fa13a9c3a2ca29acf4d2ab4bc178ab7389c7fbcac0c819c5fab5e2921b451b75e0ae0')
b2sums_aarch64=('62964112504775c23eb56e3db267089a341e10d9f56a370e112a65ee6149ad9565582e99930b07db62de09d26651ae8487de336883cf831eb9df31ef6bd36098')
b2sums_armv7h=('ccd1d974820aa49b16807f0f411e2251933e4eb20974dd1cc4a7af0fde1e21d2d9f9f2bfc5d9f508fc73c2c672573006e0940fc5b9189bd8d9c21b772e8893e1')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
