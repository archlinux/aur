# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=94.0.4606.61
pkgrel=1
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('2cfefb74baf637a550808b05bd15b4b91f3bb53a28a3ace1759af7e6da3a22af14e7539039322a54d66c83b7e9ef4e215bedc54c3ed248d73d8102f7caa82c98')
    b2sums=('138f154e722fb91b783c58aa61d6572ef2059c05d80bef42236a22e7095f357d0083e22035936da61c46e0452a8ed6c7879dbc7bb2e721d74776564bc33b94d2')
    b3sums=('6bf301c35513796d3a0c2af0f0b13449067f757357fb1bf6e226a50e90d614d4')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('12e161a3ded329c166ee45281b25bc21bea637352f966c37a14134c805ba1ded489d42be40667b3f50b698771d8c70693c5bfb6d639a3c54cdff090a4bd6caa6')
    b2sums=('15c2615ba159a973b623e76b6c4fc922a09fd85994fa9d807bd42d43a7e47dc6564763ce07e157d9c71baea7ba45b14e539b1a7a05c2b5567919f5929cba4384')
    b3sums=('6ca1a1b2928959913985315745a680080cca26e65c48f9ff425f19be398dde4c')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('53efde2e2efcb5ec776cb1937fc544321781b8e61f42be7d629cbe04d80bd8f405b6157faf37030b579e8dce5b1e4d0c58ea666da75dc4e81268d04f87846786')
    b2sums=('768fe49167a0f2620b0eecccbea8494a2e555c935cc7aa3d16f65430561e78499ff71c697376888767101c0e997cb7b58c14ac5674269f527987fc4e83a1a045')
    b3sums=('3c44cac453fd24169afead25cf6c84941dd25ce38d53c4dc4a0c07153660d475')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('dd07604715757880dd2e4dadfb92ba3c470ab8910106d1ac4866274cad0221a0de36e883c6cab7442d30ae186b8357e68035ada5aacd15284ef1769102dd23dd')
    b2sums=('22ba69e58f1748cbcfa3fe2d22506b7dde3db30925d30b488f43b9dd1ad2c62480ab5ad06ceaa28775062e6e72c0331ca6e059378496e210b59506b94b11ebfc')
    b3sums=('5e7850ea549739530d7c36cd4f7e0af858dc328a040b6420d7650e719ee8ddc0')
  ;;
  *)
    _arch="unknown"
  ;;
esac
source=( ${_pkgname}-${pkgver}-${pkgrel}-${_arch}.tar.gz::https://github.com/klzgrad/naiveproxy/releases/download/v${pkgver}-${pkgrel}/naiveproxy-v${pkgver}-${pkgrel}-linux-${_arch}.tar.xz)
backup=(etc/naiveproxy/config.json)
provides=('naiveproxy')
conflicts=('naiveproxy' 'naiveproxy-git')

package(){
  pushd ${srcdir}/${_pkgname}-v${pkgver}-${pkgrel}-linux-${_arch}
  install -Dm755 naive ${pkgdir}/usr/bin/naiveproxy
  install -Dm644 config.json ${pkgdir}/etc/naiveproxy/config.json
  install -Dm644 USAGE.txt ${pkgdir}/usr/share/doc/naiveproxy/USAGE.txt
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/naiveproxy/LICENSE
  popd
}
