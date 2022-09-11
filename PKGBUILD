# Maintainer: jmcb <joelsgp@protonmail.com>

# doesn't work: game tries to log to working directory which makes permission error

pkgname=tachyons
pkgver=a0.8.34
pkgrel=1
pkgdesc="It's like FTL but multiplayer :)"
arch=('any')
url="https://spektor.itch.io/tachyon"
license=('custom')
depends=('java-runtime<15' 'jre8-openjdk'
         'alsa-lib' 'openal')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
source=("file://Tachyons a0834 lin.zip"
        "${pkgname}-client"
        "${pkgname}-server")
noextract=()
sha256sums=('7d2f77204595c5c1cf7931cbcc1207e675213dc0f0693ea9f6192e58509027cd'
            '1f33ccd0e0b55d9ddda075d300bd7d003df704335aed0b7429c1dc7ea94c25a4'
            'eadb62ef496b569acdc49f25aa6abe2f2a9f5504b173edd04de4a5a2db4535ba')

_name="Tachyons a0834"


prepare() {
	cd "${_name}"

  rm client/StartClientConsole.sh client/Data/subversion.dat
  rm server/StartServerConsole.sh server/subversion.dat
  rm -rf jre/
}

package() {
  _dest="${pkgdir}"/opt/${pkgname}
  install -Dt "${_dest}" "${pkgname}-client" "${pkgname}-server"

  cd "${_name}"
  install -d "${_dest}"
  cp -rt "${_dest}" client/ server/
  
}
