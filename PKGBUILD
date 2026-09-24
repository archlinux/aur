# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.22.0
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
b2sums_x86_64=('09177198e325c7286451a8bcf07eb1458e63531e7d53d01a2c3a7e198c51c8bde3ba2e40046626454f82b4a336937b79f4ce927720de5a4a4cdd55fac7075b6f')
b2sums_aarch64=('7e409594a9989b5971d31777ea4d6e4a522678559ce7aede0b590dad63247a572299b9b76a4f1ac3f94e3bb3d3b9bfd9dfa9d941288761dd0ebbeec67bab892b')
b2sums_armv7h=('52816b41d84ef11c3b67340937cec743566a298f9d8128aef13c303bdc8d3daec6f6e4af415d1bbd7143907097acba7c48c4ba43d098fd6a8f2602be4775d08e')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
