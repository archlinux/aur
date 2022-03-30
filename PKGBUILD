# Maintainer: navigaid <navigaid@gmail.com>

pkgname=naiveproxy-bin
_pkgname=naiveproxy
pkgdesc='Make a fortune quietly'
pkgver=100.0.4896.60
pkgrel=1
arch=('x86_64' 'i386' 'i686' 'aarch64' 'arm' 'armv7h' 'mips64el' 'mipsel')
url='https://github.com/klzgrad/naiveproxy'
license=('BSD')
depends=('nspr' 'nss')
case "${CARCH}" in
  x86_64)
    _CARCH="x64"
    sha512sums=('d5d88d32e4e88b4aa53e376385d71d960959cb2527ac1d65d82c8585c02adcc8bb74a2caa9a7755245f6e100fcf1b84031d6559cd07eb59bc19793cdce2c4fc3')
    b2sums=(    '28e32cd5df662b3aafd3269855ddcef86404bc649f98582932887180a1d32fc3e8f2a62b390b8f7d2e6dff58a9ff2f0a202c43bea5012559e02fd7f8b9aaffb9')
    b3sums=(    '40bee45d4882d218579a77a9e53b037e3f208e64b33d7c4f91d762f623382606')
  ;;
  i*86)
    _CARCH="x86"
    sha512sums=('4747103c7445d8a8aa8a41852a002393738a1f59fb089cb07c6eed94a6004af3ff849210a40fb5ddce3a7b66671c2a79c962f7b0f5c86e793a4e012b6ee539c2')
    b2sums=(    '2d52a1d1b581a89b91e7523ca07ad9673617327f607d27bb8d5bd5417fe51f724033fae51d4e0bc8655dd8265593f212029cac7de8795209396cd8942b2ede5e')
    b3sums=(    'e8b4795b6f6870484982e18b5be2330f5e1177284d766bd7aadcd4834bfd6b9c')
  ;;
  aarch64)
    _CARCH="arm64"
    sha512sums=('5e0e5d1b99f4c68fc9c95425d6e5b4eafef5d3d03b36c2ae269603c8a3f5aba7c591f1bfd6e7881ef1d123679c5a703a53741e4bd0ae2fa41c3fce2ecb50d16e')
    b2sums=(    'f9d3c8ac3b99560db3b72b9e951a363c89dd028d7543fcce0380a25a33d9750360320f6087efe667c10e0898be871736be835f082205867c852cee1ec7d6bd00')
    b3sums=(    '1133dccc7ea8456511c169847d2f4efdad1e24293ace02c1cfe3266e7d446ec6')
  ;;
  arm*)
    _CARCH="arm"
    sha512sums=('54742f662375f238822fc8b2ed3d6a1eae79f2192e7bf57a49fa4001f49230d370d69d5cb743bf9f2cbbe4f37b6aa1b78b45805487b8d01c16dc0f89dfbee670')
    b2sums=(    'd18d5ada5d566b0447d625314b23b5b27a6e04828c9780bd18a92a50e5314333a73ec9e4ae438eada1f82d31331904e54f3747e20c4e843a85de7f2757589a0e')
    b3sums=(    '5e8b0caff123aca6c04a540fc6aa8df273571915c11cb03f5703d8b3707cdf91')
  ;;
  mips64el)
    _CARCH="mips64el"
    sha512sums=('650c5946d9500267988e72b7deeb53df3e148eb953a375f2eb3998e4e67db07509d5702bc1ac6f7bce9e5d1fbdc6f35cd1dd9292af0c444aa50f7e34df1b236e')
    b2sums=(    'd953953d4e571b412bab0870766342027bc30f48355b8e4a7728a8b9e0149e80a8ac3df5625e3cb2db369cc49390594d970c2547f0e377a30a7d713f99d5267c')
    b3sums=(    '95ea40c61a7e3b8e7431dee54862573298adf405ef53d4da0ae8ede7cafe9ef8')
  ;;
  mipsel)
    _CARCH="mipsel"
    sha512sums=('48dd89b5a3ba6f8e714fafeea4f0b4ad5b5fe30eba9a5f8cc49bdd1de8b278d0c03514c89dd99d0e419a287d3c72a7eaf033bc7c658f712ac4c289e488d4cee5')
    b2sums=(    '991246a442844830ff0358b38c7f6b3fd689a90b0ad04088861c6f8494bf4911887d71d990127ff9c0d20289c020cfbca3095c668f7240d3216c10b64179b9d1')
    b3sums=(    '2a6c54ec3ac3e98ea614e523c2ac0ed1fadee29cf017c2b9fca5dcddc69de489')
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
