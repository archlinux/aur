# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.17.0
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
b2sums_x86_64=('dcb695807f184248662f08224f0911a7060341bb8d32302eff1b38819e902f6bf8e9d8e093bdcf4507f93efa6f405c0fc8c9484837fc66ce0da71884b13e0fe2')
b2sums_aarch64=('8781c1b720202a9254603083ae09a7ffe17155ec9fb62db4d09bbefe00ec52f064aafad126d5d4c2556c1e790252c3b5ffcdc1814678c01cd408b08a791059bd')
b2sums_armv7h=('35bea42b54b43b7f3cb4856a7af23b76420bec0e956426276ef24043325b25d051e5ad130c9cccf9293379570430c78dcc4fbac744e80608fa82bf0d4b34a6e2')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
