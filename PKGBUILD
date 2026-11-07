# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.29.0
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
b2sums_x86_64=('b39033c4b52fe9b3572fdef0acf2d5adf1a209b7126154693e8990f035c2d4c9c5e2446b772d05ba1e0aafba3eb19e77aced7bf527c25b5a92336f4864c38643')
b2sums_aarch64=('5e8bf2137dd75c667dce23aa8f85dfcd0bc38538e19520c894b252abf5c3312071ed2fcb432f22f8723a9f91e47be1a1c97e4c2d67740ce0f26e23fb2b4ed796')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
