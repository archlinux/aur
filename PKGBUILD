# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=98.0.4758.80
pkgrel=2
arch=('x86_64' 'i386' 'i686' 'aarch64' 'arm' 'armv7h' 'mips64el' 'mipsel')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
case "${CARCH}" in
  x86_64)
    _CARCH="x64"
    sha512sums=('0214e4088d846801e275598e897da11064093eba5fef916a63ed8c2440bcfff77e91fdce7f21725cf7efa2650ea01a7f8e69d862b5a3bb9d610eaeb773f018d4')
    b2sums=(    '50df9a631a107b0109e8effc3d1671c7179725a29ea308655f45f7f4b5a63ef509cf6e14da3387e72ce8dff1fcdfc9319c5c4779e24c64fc4365d0d6a98a73a2')
    b3sums=(    'ec04bce82571623a9df511d893e397f7c0189a0a8e050115667d16a42c9d4f15')
  ;;
  i*86)
    _CARCH="x86"
    sha512sums=('e48aab56015a6ce49450a690b91672feda9768c31c1fe0f857eeee6537f8228193a79ca3b80f53cacd098951373decad2ddbc51f59f4423bd277668356c3c46f')
    b2sums=(    '7524b836e70e7ddcaf89314b94ee5030dedb6fc0cde62edf470c127174cfc83f3b3bbed51ecd39780b34a5444e298a5be746aded21d802fb86f77e3703f2b3a2')
    b3sums=(    '0b907468f350bb310780244866466c756f083c2ba7f4745c762bd389c07bf242')
  ;;
  aarch64)
    _CARCH="arm64"
    sha512sums=('bae7dcf88e1ba59a87bb88e1e376135d9c90c29fbcd5e86ffa8dab24689b04e4383da298f95ce833059f5aab2ade863478247c0b6f2b938a2d729ac4fdd28fdf')
    b2sums=(    'c80eb843ad8a38488b29e9699ff9613ee55fa810f412ee1a452e86004e9c6ac6cee3a0cb8ca1ebb680ee3181ee63d8dca599f899a034354d17ab1d74b5084548')
    b3sums=(    'c822a32cc018bdb3f3c51df9dbd4e1f93b896f2c0573790a1209e318b23bfb68')
  ;;
  arm*)
    _CARCH="arm"
    sha512sums=('9a8fd9fa64511ac405be66b49840a698f17a72d1d11944e9c04500e28e1a6493dae10ea9967371c42f0232ba0c663c426fe90579b386fad0826026eccb118a1a')
    b2sums=(    '42bb9e2fce9b4934ab3b4125025b8911695157e9b9154cc5707066754a45b1dd0d29631ca561ba2e1c3c6e03b430b84628c3d742ea85956ea8ee0d520ee13f73')
    b3sums=(    '7a5bc5973cc7066ab5e11a986aba85f95ee273f71769bebe7b6e98811f7c397f')
  ;;
  mips64el)
    _CARCH="mips64el"
    sha512sums=('a58200f79275c409c350115edeaee4718162105f9942e30e69983433fd4e5768035587036c98930604b34907d57696a334ff4bb8ef0827cca1a046145da3d5fc')
    b2sums=(    'b136033f003a077cef0c0a835ba739ffd22c92288c7d6b5da8aed828f9b9fbdc7afdf9389b6b22b37e0fca7af9c8ee3d9d9559a4c66a0c9139f15a3f69ee4f90')
    b3sums=(    'cb8f8994f6b35f08d80a56553a369cce6714cfeee32ca83d214658aab81ee7cb')
  ;;
  mipsel)
    _CARCH="mipsel"
    sha512sums=('af812450673220df430808b691aa66f876add8a09fe4574b65cfb8859035ee04572274070bc615c69649951da16a5ca0e4d3486a85c739f832576a0cf8a09a8b')
    b2sums=(    '33122f2cd758b178e53a5bb6a070dd3b550929affc774fa5423116debfa89a348a9fa51b4342cc1c6a92a2983afe67ce83af6a39b430783459f7111ce9002818')
    b3sums=(    '38a74feb7f93c77d806421b892602251f273ae98571525cbdf859b0535ba3b08')
  ;;
esac
source=("${_pkgname}-${pkgver}-${pkgrel}-${_CARCH}.tar.xz::https://github.com/klzgrad/naiveproxy/releases/download/v${pkgver}-${pkgrel}/naiveproxy-v${pkgver}-${pkgrel}-linux-${_CARCH}.tar.xz")
backup=('etc/naiveproxy/config.json')
provides=('naiveproxy')
conflicts=('naiveproxy' 'naiveproxy-git')

package(){
  pushd "${srcdir}/${_pkgname}-v${pkgver}-${pkgrel}-linux-${_CARCH}"
  install -Dm755 naive "${pkgdir}/usr/bin/naiveproxy"
  install -Dm644 config.json "${pkgdir}/etc/naiveproxy/config.json"
  install -Dm644 USAGE.txt "${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/naiveproxy/LICENSE"
  popd
}
