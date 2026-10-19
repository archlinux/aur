# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname='teams-for-linux-bin'
pkgver=2.26.0
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
b2sums_x86_64=('522467c702dfddd5b02e079ad67b0157f65bfa6aa81444d126fdd6b18e31f8d228ba2af64f4fafb88782af306b939d2d2740d295ac23251cd720735de45457c5')
b2sums_aarch64=('48ac22ed6f9d80ec51d48b43b0c513d6be2623479c5bcf097f287802dddac35cfd2f18485abdf3659b0e86807f17c065ecc6aa836cf6245643b7d22010f1406f')
b2sums_armv7h=('f1f5138c1d71729ceddbc254944c4c59f993284a83b938ffc83df4ec9a184114af3cee6eee075fe821dcf3d16b322cebb1956f53247a77ba45106845f320f8a0')
options=('!strip')

prepare(){
 tar -xf "data.tar.xz"
}

package(){
 cp -r "opt" "$pkgdir"
 cp -r "usr" "$pkgdir"
}
