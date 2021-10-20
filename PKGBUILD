# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=95.0.4638.54
pkgrel=1
arch=('x86_64' 'i386' 'i686' 'pentium4' 'aarch64' 'arm' 'armv7h')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
_arch=""
case "$CARCH" in
  x86_64|amd64)
    _arch="x64"
    sha512sums=('4159a27fe949e6b7e18d4e8cccaf1acbf109269c1bd0ce8d720a8330e08ca0319e0162dc54614a4b6a1195d656dfd50588d684a218d6ee07c45e7092794e5f7d')
    b2sums=('fbd66f9ab354de9ac452dfb0cb2633e5a82009f75171ae9a2396be1e10003020a747c4225bb790a1b65d08f038ee60ab6ff4413cb302eac2f891f3adef90281c')
    b3sums=('9b19612985abc49a8abf09d43cf103fbf4eb9a01503611f92fa795b7f7cfc8f5')
  ;;
  i686|i386|pentium4)
    _arch="x86"
    sha512sums=('ca4d5bbac808b760c1603296aea7de3d90544bfc88132d2f113273bc8f5c95460a952ee5c6bc0c95be566908f0d30ddf90825e09f844b24483af7d128438a67d')
    b2sums=('840fb1eeff61e4d90f953e71dbceb57318934c60d3e114fd898adc2b1a55142ae0f60899e35180fb95c4ee7f7dc107672b29bb6ce4939c480e210b6740811a2a')
    b3sums=('ec467a53b0c24ed4f4ece192cb303c9f15305732d4ace7b21d34477466b74007')
  ;;
  arm|armv7*)
    _arch="arm"
    sha512sums=('5bb89a67d078134d791f24c46c563118a3bac775ba26d3b81defa507f83a4c613ecdf2dac941703d7b121d3bba283b827acd8e7222c9b262f9683c823ea2a68c')
    b2sums=('63ebf28d3ff8b6853e309c491db3d6a6dd860de216a4e1f5aaa906efa3edff7813865480ba93464728b799ef64701e9c42d322a84d5ee249020e6055b186859a')
    b3sums=('5d3998d834223960726b81583fc9cdc8a377fe3347e3e34296c26e194b08d48e')
  ;;
  aarch64*|armv8*)
    _arch="arm64"
    sha512sums=('d00e899daed9fda66c62bc0ef8678d36c99859fb3f69b8957f78865a61b90f6dd15afe0136bf3c686751f92729e5b04d18a7f4f9b699f6a0f38b83e1691f27d5')
    b2sums=('f6aca250776cd838840dfbb27abd6105dfce39cacda336fe5ba26bc3ba71c8552d43b66eda3648eded4335b57a04801a212dccc4bfbba799582fe17c33427797')
    b3sums=('508aa4b8d485118ab8106ee2e5071987f7b9e8b06e6b07af6698f1a49989a3eb')
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
