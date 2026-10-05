# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.23.0
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
b2sums_x86_64=('05c7e438c72f67a7aab700fb2e1def70e1a1ca17824f40eeddbf419449903a4bb3231d32cd3e7afe1e9e9d88e858451132d1a9ab02927318388370f74ee08e02')
b2sums_aarch64=('ef4c4858e9b514a9da23612226055cfb2cd1ca5dee0b5a92cfde719a7265b0a1fbc5c6dcf51090d2e38e6af177c5a07f276d3c46031d4a2aa60d2317ef5caded')
b2sums_armv7h=('5f6e3e96e90ca67c863ccdbd866ee1090588a0f104adf859a817a6ded8540977609835f94a6234cf3d15f884a77d00d8c4ea9b7a67244de9cee5e547abc7fccb')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
