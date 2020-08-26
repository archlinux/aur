# Maintainer: MCMic <come@chilliet.eu>
# Contributor: MCMic <come@chilliet.eu>

pkgname=yarntown
pkgver=1.0.5
pkgrel=2
pkgdesc="A Zeldalike tribute to Bloodborne. Explore the streets of a cursed, gothic town, hunting beasts and uncovering twisted bosses."
arch=('any')
url="https://maxatrillionator.itch.io/yarntown"
license=('custom')
groups=()
depends=('solarus>=1.6.0')
makedepends=('gendesk')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MaxMraz/${pkgname}/releases/download/v${pkgver}/${pkgname}.solarus"
        "https://github.com/MaxMraz/${pkgname}/raw/master/medias/icon/icon_128.png")
noextract=("${pkgname}.solarus")
md5sums=('662e020063bac3e07c9e1322fce81ef8'
        '9257c8b911a185e243970ef7411c9bbc')

_name="Yarntown"
_categories="Game;ActionGame"

prepare() {
  cd "${srcdir}"
  gendesk -f -n ../PKGBUILD
}

build() {
  cd "${srcdir}"
  echo -e "#!/bin/sh\nsolarus-run /usr/share/solarus/$pkgname/$pkgname.solarus $*" > $pkgname
}

package() {
  cd "${srcdir}"
  install -Dm0644 ./$pkgname.solarus "$pkgdir"/usr/share/solarus/$pkgname/$pkgname.solarus
  install -Dm0755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm0644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm0644 icon_128.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
}

