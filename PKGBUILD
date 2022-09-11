# Maintainer: jmcb <joelsgp@protonmail.com>
pkgname=tachyons
pkgver=a0.8.34
pkgrel=1
pkgdesc="It's like FTL but multiplayer :)"
arch=('any')
url="https://spektor.itch.io/tachyon"
license=('custom')
depends=('java-runtime<15' 'jre11-openjdk')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("file://Tachyons a0834 lin.zip")
noextract=()
sha256sums=('7d2f77204595c5c1cf7931cbcc1207e675213dc0f0693ea9f6192e58509027cd')

_name="Tachyons a0834"


prepare() {
	cd "${_name}"

  rm client/StartClientConsole.sh client/Data/subversion.dat
  rm server/StartServerConsole.sh server/subversion.dat
  rm -rf jre/
}

package() {
	cd "${_name}"
	
  _dest="${pkgdir}"/opt/${pkgname}
  install -dm644 ${_dest}
  cp -rt ${_dest} client/ server/
}
