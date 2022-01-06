# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=97.0.4692.71
pkgrel="${_pkgrel:-2}"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('55b6da702ecb5d5ec2963509e7874f08379a5562ec60e41b7f7e7b0417e5074eff7f159c52fabdc0257aed7c410d929a7608be7d1bc40f6c29da99220d6b2edf')
    b2sums=('744317fca4f7fe2ad4d20e3a3b02e0765e1ed3f71f8ffde4309ede132a123bc52ea1d42a6f078fbb94cd25e5a98c523305a0fb0b8e2c56ea9b3fcfe825ca6505')
    b3sums=('590f66223f8c69c659c84f002fc5ee538ae131350863eaa84cfa594400ba12a0')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('0145f99b2e4549c76e09b52896411d5a0d23665af5ed7fcecf47969a77e9c192f40535b3adee4206f6b82d3afe06614725bfb22aefc4fc2c63891079c68f0865')
    b2sums=('2f1a5e19414afc9be901414f5dbee0d955c70b8486315df2f328a1f4fa2d5e7629f576192f8f577b7c72bcfc20c761f2c3a828712d6d220faa3dc0b8d3a6f204')
    b3sums=('798b7d63325720f37caa06ef9f39768c44abbc740efd7869a9580b14500edcbf')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('620d5ebf29ed1c31be9aa6ee84197f9e3356f0ad72e56ae045c5db42646c1324787fb2e4ed998c98d63fac91aca541b99ddaf9ee87d80786926de19785ccc63d')
    b2sums=('59bfc73d948aae05d93794cd5a65e5fa5874613cc544d0610345e5c0b0df434891b4be36a1efe7b1ec82f40a030d53101ec3f2e0f122a46f2e204bc15bee3f1e')
    b3sums=('eaf75feffa59feae5b0e69d4f03e500e4788ee1f20401fae22339365c9f8af56')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('9de7238803e64d0ed13b8b3975509b6ed922ad3a966bb42755d27106acd5b9debb44e17e651a56912cadc80c86d25bfd8e3cc3e4bbe27e9c432d5820ecee1e56')
    b2sums=('194572ab14b2da49ee3255709e148654479d8e90e2951be495ca2b7ccad068ebe8a6b2d6024c5b6a855a2ee7d03779f4ba422503b577cc13f221b6c68c1c4b97')
    b3sums=('8357f806b3efba0f8f35b17e2c00c7f8a0865cc6e0361cb157273416bff0af3d')
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
