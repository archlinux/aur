# Maintainer: Simon Wilper <sxw@chronowerks.de>

pkgname=('cutelyst-tutorial-git')
pkgver=2.0.0
pkgrel=1
pkgdesc="The Wiki tutorial from Github as a local copy"
arch=('any')
url="http://cutelyst.org"
license=('LGPL2.1')
makedepends=('discount')
source=(
    'Tutorial_01_Intro.md'
    'Tutorial_02_CutelystBasics.md'
    'Tutorial_03_MoreCutelystBasics.md'
    'Tutorial_04_BasicCRUD.md'
    'Tutorial_05_Authentication.md'
    'default.css'
)

build() {
  cd $startdir
  ./proc.sh out
}

package() {
  cd $startdir
  local t=usr/share/doc/cutelyst/tutorial
  install -d -m755 ${pkgdir}/$t/
  install -m644 out/*.html ${pkgdir}/$t/
  install -m644 default.css ${pkgdir}/$t/
}
sha512sums=('5853c75e508bf0b77b9c7d31349c9ebfed5203bf22cdc43eaefa0d67dc1861dd3f14dad3d1ba44079aedcd0155c159839e908cef27931031c71747b3dc7b49d2'
            '28a469412467f015558487e2d9885e6e6a457fc490c78e06f36b78f058c8c516a346625c13f1a727126599999147ef9c92c234ad65835cfba91f027c51869a64'
            '2cb5564f3f7bc3d78e29c920b1638d857892f38e24ba39f1c4c11cab95b4b32dd5a77f1b614c57e0b484cf086c8a31f4abd348662bb8953457b219b9e71220bb'
            '2208df26239e7ab11b4ef31e5b6d4fbb4095ec07c1655bde00a3ac9e94d847609b8c25e0016be16341197093d9f00f2b9cd947e65a93569c8b60e29200b4900f'
            'cf0c683991c71e7b29a78f48a15f7514e282612221cc8ad31d5129f67df5d007eedf32442d6b5b1c402c949761ddbc4f6b08ddc37829245ff52731bb0e1617a8'
            '6f5d6f353d66f785ada9c5060c01d2fec7a2b4dba642d81da59e2f0021351129569b20e741cc0b7f9b16abf7ae6447b1617b51054dfbe5e08fada7af1d529451')
