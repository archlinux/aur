# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=98.0.4758.80
pkgrel="${_pkgrel:-1}"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('a6117c7f679487187ddc8cb343ed78a72ed039ca33b78093fd625caffe5581b03fa8b2f3bfd9bb48c4d93ec2c3461363641e4fba2dec09c1f312cd8e810707ed')
    b2sums=(    '63a1a5b6ca40423dd54499c9f516f30bc0b9f59cc776cf8ff7fc33f5e89f58d17935d938abc9e5c5fb086af06b0c048cc0480a4c33c0b683ec0b0962f25c03f9')
    b3sums=(    '04c6e2ec28d9393a4ffb8660d6252c5cb2cc33240d62ea5f4489fe9324aeb51c')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('23ec3d50c4c95ca17d993a89a99965d85122ab1743339aa86968c6e1bd65b2ba907220b6dad4dd24445a900ff865f8b0f61b5fd53bb5ef902e9360264aa9f0a2')
    b2sums=(    '0d46d2d29bb759470dc1cd01e28892496800c2dd007bb1d96224b5ea26770549ec81e6898fd552eda75c7fc75d4f0eb7847ab99fe3d7053e4ac098101cee0a12')
    b3sums=(    '5cba4256194a54a77295873cfeefa98642955621ad4b12a2619ec5aa60b752de')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('ce94c27c70b7e65d45bf8ac0e8726cda83dfd643c7ece1638254bef65d5b0de46fc14bf808b13fa677b0216367d6cb9f7c22101f67e9965538d750e668c79ada')
    b2sums=(    '48da50aa7107b2047a75b07a74ea3c8765bc59a15abaced50a41c0b01b0ee06c1480f55f46e40f92cf6998485049bf11150f9cd38c18b0aa67c56a3e28bd8d07')
    b3sums=(    '9b8ab527e95dbb5c67fa3fd9ad1dcc1d9a888485470884c879d97eacbebc0503')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('44f2822925ac3ff65cb66db8987e37e54b97378b33a6c09314bafd5044917716bbc8d2f31f5c8d0acea9ae1a30ebdd091e5af487f45b6c0da27e658df8274b5c')
    b2sums=(    'e16da6e34b0fb4bb5d926fd3492c2901176ecd935da4cff4a751ee91f00649099aed8ba82a66b97ebd6fb03cc360bbed5a82516851c1164dfe0f5d1559fa6adb')
    b3sums=(    'bf4d10158b39f4b258d3a72cddf1988a354abb7b27b7ea370a3cd4c35e4b8cb6')
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
