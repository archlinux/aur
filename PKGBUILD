# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.32.0
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
b2sums_x86_64=('295c587c72254403b662d55a2f3029b8a5875ebb3e940768e9d4f4a4f6fb27c1f5deb1d709a7d729a7665a6f32558ab20d52d138b3875c945c44112c7831e9a9')
b2sums_aarch64=('ed68868ae403682107c1eff37dfd3ad151376b43beb7131cd0c4613ffc09a202c87f1f09dd877ebc5393c5299a72276b65ecfbccae677391e0b24bae523f1e1e')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
