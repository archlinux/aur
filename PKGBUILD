# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=101.0.4951.41
pkgrel=1
arch=('x86_64' 'i386' 'i686' 'aarch64' 'arm' 'armv7h' 'mips64el' 'mipsel')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
case "${CARCH}" in
  x86_64)
    _CARCH="x64"
    sha512sums=('b77f37f2995e0a457f7dd8770e8d04b8ef97bed03b7c764d9bcbbe95ec871468e0f3c2f738aad97ecc60085fa79a0eafb9b8ea3219e73182649d39aa67d69ee6')
    b2sums=(    '2f9df708572191a6818cf2cc58739aa0526e81c09efe6a221dca29a9ae0df78d5a77ab1874738a85dce73bd18df4c09f33005aa35f4c368c52a3f0d54794abd5')
    b3sums=(    'c415a85465d25de62f69aa17b271712fdcf2ab32967f18d7bcbaefff45e555c5')
  ;;
  i*86)
    _CARCH="x86"
    sha512sums=('d4a1a505dc0f8b59df4f5fc832d3a3b5a31138e55f9f5a66f24424f812917cb354f2aed641275a542dc46aecdc583b2dc45065feb76735ee66f34e44461f6121')
    b2sums=(    '1a57aa464f820271536b5918ebce088c53e02221ab865c23d1a664eaa9e8311c93d97405ae21861ab52fc718576e070964e113744a9331e93743ed8b4c6b99e8')
    b3sums=(    'd2674b4fabfa367b145b4d52b91524b9a0cf271c3749b3bb2b5ab048cc5ebc49')
  ;;
  aarch64)
    _CARCH="arm64"
    sha512sums=('d61a8e8277bdb97f018d3595c94d2e365ae4f59c4bffda8fdc2ce916ba4dee6082851ff53a7ca4ea15d6d13a673e24070677dbb975f88b9c9bd5a2c285aab0db')
    b2sums=(    '3a92c48c3454c42e6462f43f530bee41a7b31c499a757584be4ac23ffcfc18876d60a53d7299922e88940b16a86d193bd7edcc96a114722621aea0cecc412c97')
    b3sums=(    '20c28cd6724159506bd135ec837e4ab47ab8723e81ba6f327ef29bf5fd54102c')
  ;;
  arm*)
    _CARCH="arm"
    sha512sums=('b652f447edcb79cf81861fa69675aa0e5b0d9bcc76f8d00becd3c173149468d7da56395cdbbbe906ab19ed0f3943e71a8c8983c9043d7357f405bf168437579c')
    b2sums=(    '889948cc7b9c39491b1f2ecf592a32ccdc28f0c96f68a80850cb5645dd6d87bb13c9409f39acce5aff14757c10c482af952f65c1f1fad138b28701d65cff4450')
    b3sums=(    'cdbe54edc4838a30fa3312fbc290577e2d8dc7d3f5ee7bb60f1629791556c317')
  ;;
  mips64el)
    _CARCH="mips64el"
    sha512sums=('2e2a993fc744d88f85b9d51558aff4400753bdea7b1903a4f860cd9665d966521bd3cd152e4cb827ebdfe9ddfad5248a8f6b075242e516da86cb86a9c7abecc7')
    b2sums=(    'ac9718c78ca2b1c60cf7e07a29e44819714d471207881dcb0760157eab5d8c35e855d2db3e184f8a94560c30ee547698e5176df82fd233615ffe67782374acb0')
    b3sums=(    '798b864835684d6d83c50d716eacf05c99b07d8fd7120ebdf896d343d29aa753')
  ;;
  mipsel)
    _CARCH="mipsel"
    sha512sums=('eb099d0885bafc5154f4326d3a77b76816350df64049bcab3aa2c34b32645d63191eeb7aa777ba53ed0472e6e0881638f140611a01d5a02443be7d07d82fc5e3')
    b2sums=(    '6b3c942929f44673743e416e3588c6477917662076a19cedc1d5d6d7c1572c54567ff57336727b1bb664f2bcabfaa038a9ca613e659cb5f781c93a5db9a92632')
    b3sums=(    'd36fc07744beb0377ae5d42fb54d746f71b418a5004214d396d954df6039f4e6')
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
