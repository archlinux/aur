# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=97.0.4692.71
pkgrel="${_pkgrel:-1}"
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('9898de42dfda9c97e04ed01ab605f2c7e1c6a68e08fe810b25d406c5683fe6185c5fbfe58a14ad5e9e565a3eff3015326f5cd67bc70a7bf668b544389fd162a5')
    b2sums=('806ed40c31a9883a870d500d04bd3a8a7d132ec953e410f929e04be98ac39af63a0207991137be57d5dd0cc2fbb696c79b841f05c59707b5c91591b54e2d21a8')
    b3sums=('1263c5326b04b7d3856ea248be0c48c08dd7092cf027402197edcddbe67b081a')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('a60380128f8f51c5114878c0eb96ef5f11a14f98fe644a98745e2870af21f702a8c59b872520ce8c018d0d1ce91bd995ce1ba0daa5d6c3497a5ddc9ec92fab91')
    b2sums=('06f00bea7aa2128c7f5db5f3f8d462462b94a457511411295f4a0fb2b89d9217d7634f0de3911562df5364671faf5cedf16e618e2bcf7e4d55124e5b57a2b480')
    b3sums=('ec90bd48b966a03f20573946ac0c7c935509e6653bb675b39337b097f2a76038')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('81f3c1f6d617bde905ca9a16cc47822beec79253d542a96972223ef9121dea6cd410c4f8b9daa3dfc6d47ffa5570f9d1533df80686babc370dc1eaa6f835cea9')
    b2sums=('27816ad647deef65ccdbe2b17dbb074d8a0e23e9f85effc79c529cb6fc2455f01bd6355ebeabc56fe3e43538e9b34d3f31b45d69ff7fe8f82f3e6d4a9dc689de')
    b3sums=('49766ea36a3b17bc5e2e8a948b4b059ecaf7f2b746b0f7b0e914a9f4f2cc07b5')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('fa5b63cf8ab8d68ad3a10271c9945183e7d9324f14c548801c3d90abf07e2fec250830900c90959b60964b11234a97f9a08ab091a63e047c1c12019340f03e96')
    b2sums=('a8b0a0a2b58d60b2fc8dbf4187f285a54551f9e1bd163dc02ad5daf665a175d9ab2b446f63db9a93d428792c766ac0455642be86b3e8f30f4eea0db194fea355')
    b3sums=('d31dab7f13e9be8cddea3a5fb83e402bb2d29e8afb4032ce96ed8d18ce7df827')
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
