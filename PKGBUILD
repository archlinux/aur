# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=95.0.4638.54
pkgrel=2
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('fea25353f9e08aba56c2bd87e3b78e4e0d0a4ff5c44cfdc05e888f56649df8c953fbc3021d110675372b5bde670b4c8fcc40c16bafa5ac54879487b807b3b442')
    b2sums=('ef0989a72a278347b4c4b9f7717c0b32e39b8d2d3ca6a93c1726711208033ed0867e41b946210477fabd0fa620e6de576ce99f12ea293defd7e02dd962af34fb')
    b3sums=('ab8a7cdbd4467af9ae8acde180f08d590ae86231bf44663ad365fb2efc5134ac')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('9eee71cb9cf5341685dea92652266d41de666d25c0a5d816a4037bce73a80aa0630e807e33c4515196dba3757f71816e3a2b4e86bb8af0a4158fd73ba8fc2d50')
    b2sums=('493abc7d4a399ff2988c43f6b5b4c8bde79d5e3f2cf09529bdc575a163b7d1700fd0ab5ff3aa8db7da4b0723408f46e65ee3f410a8abbe3c0197e717c94c724d')
    b3sums=('d2b8d7eab478423155544bc3775eebf3a8d4568c53f3bf31a046ce929cbfeb34')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('83a466004732ed60720284390338b029c2dc6059701850a58795c4f04383bd6f20b9f46096f47beab148b26ac007a7d66ce65eea3deac492255a468675bb107a')
    b2sums=('8bb0e5b746436718905f8345cf970a7ca507f18363a1ce0fcae0f9b8b721d27ada3bec13aa729ec341f40ffd4e88c6520c8c304c855edf10e05b26e2954b813e')
    b3sums=('ffb1d504d6d898eb27ae405c53a800b43503376a47a0927763bc7a4b82498701')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('b7ac1793582d821e4b89bfa7b37744857635db192b87a5ca7672b11dd4005b68a358938c4ea00377d2adb81b41633188235cb8da7e4c2eee70fe2dae59e6c070')
    b2sums=('8b9e8a0c87fb033550e7805245f3484874f83bf3d4cbfbeea197cbbb468a15f95264967c3255a76ee20b19216bb0cea611d7502db2c2f8f2b9000ef3977faeef')
    b3sums=('593bd59eb4ec735fa2f6dffcdb6cfd546db5fd45c78ba95119bf779e68644995')
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
