# Maintainer: dreieck

_pkgname="sdm-assist"
pkgname="${_pkgname}-bin"
pkgver=2.20A_201702
pkgrel=2
epoch=0
pkgdesc="Application designed to make the process of installing SDM Version 2.1 on your Canon camera as simple as possible."
arch=(
  any
)
url="http://zenoshrdlu.com/assist/assist.html"
license=(
  'custom: freeware'
)
groups=(
  'sdm'
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
  "assist_${pkgver}.zip::http://zenoshrdlu.com/assist/assist.zip"
  "http://www.zenoshrdlu.com/assist/assist.html"
  "http://www.zenoshrdlu.com/assist/assist0.html"
  "http://www.zenoshrdlu.com/assist/assist1.html"
  "http://www.zenoshrdlu.com/assist/assist11.html"
  "http://www.zenoshrdlu.com/assist/assist111.html"
  "http://www.zenoshrdlu.com/assist/assist2.html"
  "http://www.zenoshrdlu.com/assist/assist3.html"
  "http://www.zenoshrdlu.com/assist/assist33.html"
  "http://www.zenoshrdlu.com/assist/assist4.html"
  "http://www.zenoshrdlu.com/assist/assist40.html"
  "http://www.zenoshrdlu.com/assist/assist41.html"
  "http://www.zenoshrdlu.com/assist/assist5.html"
  "http://www.zenoshrdlu.com/assist/assist6.html"
  "http://www.zenoshrdlu.com/assist/assist7.html"
  "http://www.zenoshrdlu.com/assist/assist8.html"
  "run-assist.sh"
  "license-info.txt"
)
noextract=()
sha256sums=(
  '402cc7b2670075408513391f19433deaa57206f8ab1944602036ac239ea56753'
  'b1aa85ac7ae86ef697b2674641c45936ed5de70d5c365222f791ca07e420ef47'
  'baf3b7e722d7bc587db2e1e35cedf03bd8d8ba8d4d1ec4a2b55998ce742b8619'
  '2e67004a334a528f098117bdb640b7be17444e0ba810761968588d057208a1df'
  '31b8a98e1393054115438369f55d0f6776ecac503b57d38e748f38dc2378f868'
  '2e6bafd16d653b62c62ed4f4907f827a8a55889185df38a05dff6cb4a4ab94e5'
  'e8f6b790f665b6e849b6ca88cf338e17c97d260fe8eb472a4aa906cf59e5090e'
  '3687a56078829dfae2e2a2a7db6ab981804ab0d3c61585fa9ca262c7e9f5f09d'
  '23b25ae985f0eeae62606ee951f57be649074dbc3c0664cd2fec02eadc7915fb'
  '8360c35c26e9205339079ba12e42a91eb057bc61d3555d204c1fc7d1c4fe0bbc'
  '49e8b710a290609ee7f10424ca4b06e8eddd25639f951cd0b504065700020623'
  'ca86d753a739aac08a0be496c64639881a1bbce61751c1ec09768ac2816837f6'
  '5c4deebc350466a3caf92bac5fe729187d55ba0aafa94bb2b00db40be8a4ae5a'
  '14c8c6fb80778c115e1e5265aa832ce80b02a975e88e1d17b6205f133c0694a9'
  'bb9f6dc0cd415b4b1f1c460b3f3e251f92dc115fc07e5f1d1286a17ce9c4ca0b'
  '809148e1f84d74479bfd9ca07b14547ec5c372091f6f9e9ddb2a5027dd339a08'
  '9487c83d9e12a07dcfd350916704b8e0da714e259839aa694b638805b3c5e4e7'
  '56cf148cd3c175d2dc20296cd540a2cad589bdcfa657292317954517a17c2ec6'
)
validpgpkeys=()

prepare() {
  printf '%s\n' "${url}" > "${srcdir}/website.url"
}

package() {
  install -v -m644 -D "${srcdir}/assist/assist.jar"     "${pkgdir}/usr/lib/assist/assist.jar"
  install -v -m755 -D "${srcdir}/run-assist.sh"         "${pkgdir}/usr/bin/assist"

  for _htmlfilesuffix in '' 0 1 11 111 2 3 33 4 40 41 5 6 7 8; do
    install -v -m644 -D "${srcdir}/assist${_htmlfilesuffix}.html"         "${pkgdir}/usr/share/doc/${_pkgname}/assist${_htmlfilesuffix}.html"
  done
  install -v -m644 -D "${srcdir}/website.url"           "${pkgdir}/usr/share/doc/${_pkgname}/website.url"
  install -v -m644 -D "${srcdir}/license-info.txt"      "${pkgdir}/usr/share/licenses/${pkgname}/COPYING-info.txt"
  cd "${pkgdir}/usr/share/doc/${_pkgname}"
  ln -sfv "/usr/share/licenses/${pkgname}/COPYING-info.txt"     'COPYING-info.txt'
}
