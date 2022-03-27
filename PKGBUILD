# Maintainer: Roberto Rossini ("robymetallo") <roberto.rossini.9533@student.uu.se>
_pkgname=Juicebox
pkgname=juicebox
pkgver=2.13.07
pkgrel=1
pkgdesc='Visualization and analysis software for Hi-C data'
arch=('any')
url='https://aidenlab.org/juicebox'
license=('MIT')
depends=('java-runtime' 'sh')
makedepends=('gendesk')
source=("https://github.com/aidenlab/$_pkgname/releases/download/v.$pkgver/$pkgname.jar"
        "https://raw.githubusercontent.com/aidenlab/Juicebox/a60a11ea4cef35bed4fb3efb2120a64fb53e1ea0/LICENSE"
        "$pkgname.sh")
sha512sums=('2a4e4ba561f1ecf49dc01c6ce0bc8f78f30d0e758f015ccd35112a20a5d105b5471933eb7de84f9a79e5814f89092275daec90d44f5e59c7e456aeda0a964b8f'
            '106869ddab74b937419c54b5a9ba2a4e7dd0bf9d3ddca79dfc746ef73ade5548629ba067bafc7ceb2bf36dcdbec57cc29d1850cb9a360e4a75a8cf8a2afbe1f7'
            'daf5d5bc93a6487a86f35577812cacfe1de7052a30d14b4e2e7ba5a4a1f9ef0818f7fe4e932d029170690923ed10f0d74915dec9ff874cad47c55bd5a3945f86')

prepare() {
  gendesk -f --pkgname="$pkgname" --pkgdesc="$pkgdesc" --categories=Science PKGBUILD
}

package() {
  install -Dm644 "${pkgname}.jar"    "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 'LICENSE'           "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$pkgname.desktop"  "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm755 "$pkgname.sh"       "$pkgdir/usr/bin/$pkgname"
}
