# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=99.0.4844.51
pkgrel=1
arch=('x86_64' 'i386' 'i686' 'aarch64' 'arm' 'armv7h' 'mips64el' 'mipsel')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
case "${CARCH}" in
  x86_64)
    _CARCH="x64"
    sha512sums=('c95bfb8a382358e89965e17f3e520de4ca658f5c024b2ec1e93970f63550a83de5d5e7ac195c3e4ca611fc3dd05187068b181c0f4cc5e69745c8fb199ad58282')
    b2sums=(    '9ea5907c72448ad31d2be94c32d7ed7c39ebd3214bb5986cd06688058949a90c52d24fe35db97fc4a904706117ba7299cdd7fbbfb1c656813ea09d69c41885f6')
    b3sums=(    '86064504544f63711bc63b267fac4d3516a110764ce1e46118753b32523392f9')
  ;;
  i*86)
    _CARCH="x86"
    sha512sums=('30d28a532cad554807178f5d64896fc8e567ad06fbd5b7ee14f389249d395e1c74ab171d96160d32f24f6ef411f82b9c9e108a2a5441745ee9e7487ce228fa9d')
    b2sums=(    '95dab65db0f00d1673df3a0c2a09259e2823007f59d388577762c4552e0a0651e8faf6256c7e73230b5bb448d148d3154b2a1a34248c0670d039068fac287f9c')
    b3sums=(    '7767a8c22d3830e4e1781da64411ca33eb5a87c35a40bf77064d30565666caea')
  ;;
  aarch64)
    _CARCH="arm64"
    sha512sums=('5f9eee8477d6d002233fcd33e29791276329cfc4838ad41f89a09050ee1c89fcdb59ac06c3b30b232b55f26e2f3a95ab7d46ce2565843b44c9036f7923ed58a6')
    b2sums=(    '332374dcc6f382b695305c4c850433475312476fb2a8cdf94ee3a7aef24e75cdce0a109e3a097cc2cec3a9425f8b3121dd4c490151841f0ecf7b650b9dd76f8b')
    b3sums=(    'ff73b5de1675297675fe4d5e71aad4db83bd6fe292b3bfbb9e00c4255af18bff')
  ;;
  arm*)
    _CARCH="arm"
    sha512sums=('ea4914f0b0cca358469d32aaeecf888cd0fa36df5d7de1c45933242717ae4b4058ad127681c2250a9f093081f7ef70afbfbfd62e810020bc5909296613616474')
    b2sums=(    '17eb22934457013c1e6fb0009ab5556c9a7e0965b0a39cdac3c2912b421b987eda60831ab0740d0da696d89c9e5c664e040f4237b4c5d6984bd0af4538139945')
    b3sums=(    '28b4c7523815809361cdf4f167552cf76a4a76a5b4fc91a6f34d0f3cef736859')
  ;;
  mips64el)
    _CARCH="mips64el"
    sha512sums=('dcdc09278d7231d5547ba00784ea866beb3d038bd65509de2e3f6e28f8e8ab24d01f14013555df4d154c6d3c5f3230966812288c8bb20f47f785c2ad5da26b22')
    b2sums=(    '13c73052003eeaf91923d075da21ff7a035b03a6f860a93e35d959722583b40fc2d1d156a3a0139fe13a9526fe092ee94c9ef7cc24d0b9849f0c51467bbc2703')
    b3sums=(    'e6b2b3a7fadaed9fa7cba01efa08a4762619bf45932f5353f67c83191f5913c4')
  ;;
  mipsel)
    _CARCH="mipsel"
    sha512sums=('11564a49fb4431b85522e6a2d4c6669cfce1c76f1d0d92748789adfd8890ec9b4132fe3f3f708a286c9f18d0e7d7d3cd24122fa4fd4469c0251fb2e31129722d')
    b2sums=(    '4d6e877cb9fe71976db9c11b81aeff1296e82b9844157fdc9aa60b79b4699c457ee6f21c0fdd37d9025491f220ca7f3dc0981333cb09ce7c4ad8185e09cfce51')
    b3sums=(    'b4af017fc7c53a842362c6451acaa9af5d0b1cdc9db77f87d1cc33bbdf646100')
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
