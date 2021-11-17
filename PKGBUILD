# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=96.0.4664.45
pkgrel="${_pkgrel:-1}"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('da2310f64f55470d1025a76fcf6a191ee94e295990aac1db93766d56e011f06777a345def065ad332746bb99aaf32470b6dae6a9eefc95432413f0e0e43f240f')
    b2sums=('725292b8936346d1ac920d2bf245b87e89e32513b0c677c3832f303f004e9e74b21e0cb2d42b06bc6707fb2f263c44e99b03375316324e711ce758ea2cf49232')
    b3sums=('062ae61d76a4177463f0f88a131ff9779660926fbdb394a0a3b6655756878667')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('9d59d65460f4c26132fb61e22636081b4941de5a5eec2c7262e3e8db67d22dbb8b31d0f75587f9db3f75cc1d7afc1f18c017647ffe6372734a88a943c3d463fa')
    b2sums=('00c99675fd52fa4fe742d7e7d83119fccd7afd3537ebf0fb8337a5b76163c6e8aac4c505ccb36850987ea1c09e550f93ba6dbda70c90de5df91fc08cdac30083')
    b3sums=('264e797abfedbca2b5716e2dcd7b0e568fa00431f4a9a7ebb180eede3ac6d089')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('f1364ee7e3eaee4345418347308e0b54faa01fb3b6d0e500708b1d63a88810b932f16a63b4273adda8ea8f35b0b31ec42afef8d31d2a840c5e5ec22432606a45')
    b2sums=('a0c02cd5436ca9c604ed5f10790a68291653758cc29058eebf473928d681f55c4f336f925d18369d87109235171d0220e2b781d4f83bf9665bbb08c61ea3d518')
    b3sums=('45f6603f14003980da0a779aa096e2ce6be0cef4c71c48b741f8cb8699f08473')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('91d0b93cf55a47756949046515d3e7924ba476c0200934c32137744b132e71851c0f1abd75c85fef6fcb11f0dec9462dc7fea84fad6fddf0e85659a6bb1849f4')
    b2sums=('50f9f430ff5780bb7ecb5aadde2dac9bb3999e237cbba17c44cbc0f03409ed6e5dba66442584c0208fa7bbcab07f9b722127ce243bf448979feb881b2ea65929')
    b3sums=('4856c4031a129e6a4682561da0cee4262fbe54456c7ebc54b93f0dc1e0afb8fb')
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
