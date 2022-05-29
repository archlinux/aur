# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=102.0.5005.61
pkgrel=1
arch=('x86_64' 'i386' 'i686' 'aarch64' 'arm' 'armv7h' 'mips64el' 'mipsel')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
case "${CARCH}" in
  x86_64)
    _CARCH="x64"
    sha512sums=('6fc8c4917226cfb8a8b3e353ce93844ef64f50946bda6417f3daaf2382ade2636127cbf2eed51d2d246d49456dde86653351abea0f834aa46e9957de413929b6')
    b2sums=(    '7f1cfc7a306f0e7838385281e17f75fbf4e287c871d03fc3dcb1abb42dc2ae0b6c0cdfae17b3d775a9bd1cd5c41675dd9a031bdb571cf84cc9d4dfa4fb9985d7')
    b3sums=(    '1eb8a5de4a74be81f5e1e1f460a497914a471d628603f3f7ef69f927be5e901e')
  ;;
  i*86)
    _CARCH="x86"
    sha512sums=('fa7631be99580643bb922dcb20fdd51f4e868c17c982fc2e51037dd08a64da09f88424266474f35840df95a0be05ff67574e258c7e4f5e5131fe27f3fe890496')
    b2sums=(    'f0787d0628c8ac6decf709bf2058b2815406d50dcaf91a12c2f7acd9d10fb5e5fa6059b89ca7664fa200ecd47f011b84e1501569b1f82e3f208e6cf0deaa37b6')
    b3sums=(    '4efada442a6ec8b7e1f1c11baff8c26519411947096198fa440289302bacf763')
  ;;
  aarch64)
    _CARCH="arm64"
    sha512sums=('22e1b7ffbe35d4fd17f336a866dac35d87dc077ec98f3d21078a8eefcd0e69549bdd1a93fe27ea707940b17422f5b508dcadadafa47d949f79f0c29419527e43')
    b2sums=(    '7df66752a5bc1c19ac88f4ad3c74fa6441a79140d16cf9227036c2dd0a10f3b3753efcfb7db766c23ff7bee46ccf4714eb9aea4fdefdccb61548cc90f1647141')
    b3sums=(    '7022211592b928e28c8897789cbcbd88616a25622899e46f2f7ef7635453c588')
  ;;
  arm*)
    _CARCH="arm"
    sha512sums=('abfb9fa735c6029b391a534b8424097fbfa694b25c79eb44bc71443f9fd8ea43e01e1ca471439ce7f7fa1d45d0d2d5fd60ec63105930de3b6a283250d29c712e')
    b2sums=(    '15069b7984b51ab49d25b4f48619d44a0044312416b383678ef17173a98d10afb1ca69132a6abaa7e946791daef1bce3f9db6cb5768725f44cdb9cc8d87335e9')
    b3sums=(    '00aff2c580cc9e44714ad5b1a9f4e4141bc502f6be90db61319a3d1ea61175af')
  ;;
  mips64el)
    _CARCH="mips64el"
    sha512sums=('5639a1fbeb4de5fbaeea6fdc41ea416b04fe5f1116f0fe89b84a28b942fa4257a3dd2c3e1d7b304410cc37089ed052b1feca682378d1d2bd07988b51e8741c12')
    b2sums=(    '7dffcff1425144b31deb3183bb71ca334f2ea6017d7be5ce981a9b9b73627352ceb0e7f5387a719fe38ede5625bdd8492010137c8035143c19222cb5df09b3df')
    b3sums=(    'e45a9ebf69559770b873fff33061eb15c5abb95f9075265d882a59f6c7f8c160')
  ;;
  mipsel)
    _CARCH="mipsel"
    sha512sums=('ebd6120f6739d578f731e9899d605ead33b526c3055fa443730eb0d59e9a5d1f58a7f56334074605258e097498cd3c89301ef46f226681cf64ca8af1319ca46e')
    b2sums=(    '92214c84041a9bdd07032c27229cc0d64f0524867b3abcacae10720fc3ca641af031b47e1534c88027e8ec453dbb56710458f56a3ea19e447a7dc546afce2471')
    b3sums=(    '6d8765ec70d30a12bfc5f90579b3e2a555d5ac5891c076cc703a3e9101ef88e6')
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
