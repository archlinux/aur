# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.27.0
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
b2sums_x86_64=('8c8419547460a1f30a663188d2be14d62cf89da5f25e0ab04b2205ea848bbd092deb25aeb5e1a3c47947c70094ea26628e2a47b92b535cfe9b4418faf77788d7')
b2sums_aarch64=('94d08b239996705ca53722155a3ece3352892e8aac1c269210bfbf235b0dd78ed3e9575ef03315e49cd7f962d3d34e7c5cbffbd61c0f8af289933afbfd64cb8d')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
