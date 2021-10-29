# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=95.0.4638.54
pkgrel="${_pkgrel:-3}"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('c2b87e05ee6313a6e65ca8d7be67dbe6b4577c5cabc486395a2ef41757cfd74f766a596e99b55b6fb5ecb7ac30ebd10cd0b6fb917ab5a5fa0f88025d0f624b9f')
    b2sums=('54a13b978fcbd428518f7f6cd4f2a0dfb6070d520e6a7af0bb5b4c32d44b2029095c54b11d511cf4caea95a6ae57b5c66908bf82eeb2264b40d9197336e97a8a')
    b3sums=('6cb3fc641ebf068a1eeb7ed8ec6dada4328ade95893447b3b369ee0df1182282')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('446ac9e3ba50e6510a8eb974407a7d461b6b91214310046900b58e823b773a6f1ae2b1c47eef6e2b4f3725e962b972bff174d7e8509ff1940532b2b767f32abd')
    b2sums=('5450db4f17483a280be96d21d567c83b5810d2bda5240a2295b21fece2a6040eb86e733fabeca2ff627fc85f01d684bf97b2d6ecb8f5f7ccb96f90decef2729b')
    b3sums=('8a3e0b527e9ac188cd9ce6468f046b4f196c8fd038a51a75b7ceecc64b5e568b')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('d53b1cebe9a3b5711be9f9cacd81d8b7aacec8296f5c64d3c665cbec17ef1cb5b7a7fd0bdb43e4eb7be00b5ab544676d31c7fb7574d188bea64c8e1a3e201dfb')
    b2sums=('b692167ecdb78db43a7f2cc5f895c909b72d668c57c854709a140793f4a54edfb5f793442f2c112a44c0c2b1a93c5cb474e764269241b720531728690f8377fc')
    b3sums=('cadc40eae63410862397b069809f6fda4e3c09edb0b89407d71f0b8293426d20')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('2b67c2625d2d2e9aa16ec699bd14876b5df9cb153f15113cd01335916d4eb0b0362b15f78437df35d132fb734c9ff77a8185d57b7ecffd86d0dac5daf503dee7')
    b2sums=('386ec84ddd301603e2c7fb9d5f3c36a2e3d63898f67c267ed6bed22be4cd57bdc694e389911e7b47948b4754e1ffb39274c71bc69bd3393a20f2472707056e39')
    b3sums=('ab04cc608bec87999f2f1f8b4b07a3f13a67d879c6e5aad9b81e54179ee9cecf')
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
