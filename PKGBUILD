# Maintainer: dreieck

_pkgname="chdk-stick"
pkgname="${_pkgname}-bin"
pkgver=1.12_2020
pkgrel=1
epoch=0
pkgdesc="Application designed to make the process of installing CHDK on your Canon camera as simple as possible."
arch=(
  any
)
url="http://www.zenoshrdlu.com/stick/stick.html"
license=(
  'custom: freeware'
)
groups=(
  'chdk'
)
depends=(
  'bash'
  'java-runtime'
)
makedepends=()
checkdepends=()
optdepends=()
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
replaces=()
backup=()
options=()
install=
changelog=
source=(
  "stick_${pkgver}.zip::http://www.zenoshrdlu.com/stick/stick.zip"
  "http://www.zenoshrdlu.com/stick/stick.html"
  "http://www.zenoshrdlu.com/stick/stick0.html"
  "http://www.zenoshrdlu.com/stick/stick1.html"
  "http://www.zenoshrdlu.com/stick/stick11.html"
  "http://www.zenoshrdlu.com/stick/stick111.html"
  "http://www.zenoshrdlu.com/stick/stick2.html"
  "http://www.zenoshrdlu.com/stick/stick3.html"
  "http://www.zenoshrdlu.com/stick/stick33.html"
  "http://www.zenoshrdlu.com/stick/stick4.html"
  "http://www.zenoshrdlu.com/stick/stick40.html"
  "http://www.zenoshrdlu.com/stick/stick41.html"
  "http://www.zenoshrdlu.com/stick/stick5.html"
  "http://www.zenoshrdlu.com/stick/stick6.html"
  "http://www.zenoshrdlu.com/stick/stick7.html"
  "http://www.zenoshrdlu.com/stick/stick8.html"
  "http://www.zenoshrdlu.com/stick/stickx.html"
  "run-stick.sh"
  "license-info.txt"
)
noextract=()
sha256sums=(
  '50873c97f1cf4645b13abfb0660c96490deab67f56c106207bf7a7055a003f67'
  '5c7c275d3e75da043e7902e2cb2ce57144f9eff8ab09f3880f40b547b0782e34'
  'c44475922a8057f982e09dac5f98660b680c224572cfc10b24183e335d05a3f7'
  '706046f2800ec3e0cc629851944634b2807fcde94d4cdafdcf0383b843fc56cb'
  'ce2d44aa5b4d8705f55da7f84ae0de7ff2541f436b5887cc952a4e2611373f0e'
  'b09a39bde1b83ee9cdcb1d59e4e0d566cc07e64452c2fee9dcc39a439b7fcca7'
  '9d0cd1a50fdcf0f892a70499afbde46b7590afb79d93cece3e60d3bfe3e4ddb8'
  '53e03d602a587455c618564d7dbce2699d72827e1321e66cd031f6306cd6beff'
  'c88c053417e7c32b34220bd7e982b18b80cee6ac8c3b2e3c979ca0d9fe8dc521'
  '6115aa07d646aade52ae7c2ce30a5ca994e1a3f737c3e5c7c9553c5295c3b08f'
  '5b0dfa2bf1bddae17557e2aa02da883ed751d03cd754a6c247cf7b66824a287e'
  '421dc6726cd0585f7f0c4ccf4d378afec190fb738a360d56864587d90201ef26'
  '27af872ad4d2d90ebd8b32f94d15f2c5a0ecd6343b5998c584ce5321a391d4b9'
  'b5afa761fc9ad1527d6bb406ce6754a6a519ba02ea8ef7bad13a404953228651'
  '1815c709fc38071de3c4943da88c9b26aa3ece46f1568a0cdb224fc0f0f9a115'
  '78f542b94c694b5057074076d1c29d2768c2bf1d20ae340c5d0eeb1066f8bdc4'
  'e5ea8c9f9182a2f477e3c6b8640e0d8d143cb46e8e2d0283c09334ab129358fb'
  '755235bdedc1ec28fa2127769efc2a96d7c2499a3a4dd4966fe3cc89b9221c27'
  '2a7c6ad8d5be58f87a9068a92f1e00bf70351d6f9ca5fc314beacf11de8b8107'
)
validpgpkeys=()

prepare() {
  printf '%s\n' "${url}" > "${srcdir}/website.url"
}

package() {
  install -v -m644 -D "${srcdir}/stick/stick.jar"     "${pkgdir}/usr/lib/stick/stick.jar"
  install -v -m755 -D "${srcdir}/run-stick.sh"        "${pkgdir}/usr/bin/stick"

  for _htmlfilesuffix in '' 0 1 11 111 2 3 33 4 40 41 5 6 7 8 x; do
    install -v -m644 -D "${srcdir}/stick${_htmlfilesuffix}.html"         "${pkgdir}/usr/share/doc/${_pkgname}/stick${_htmlfilesuffix}.html"
  done
  install -v -m644 -D "${srcdir}/website.url"         "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m644 -D "${srcdir}/license-info.txt"    "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-info.txt"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sfv "/usr/share/licenses/${pkgname}/COPYING-info.txt"     'COPYING-info.txt'
}
