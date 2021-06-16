# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=quake2-demo
pkgver=3.14
pkgrel=2
pkgdesc="Quake II demo (pak0.pak) for quake II engines"
arch=('any')
url="http://www.idsoftware.com/games/quake/quake2"
license=('custom: shareware')
optdepends=('yamagi-quake2: recommended engine to play'
            'quake2: another engine to play')
source=("https://ftp.gwdg.de/pub/misc/ftp.idsoftware.com/idstuff/quake2/q2-314-demo-x86.exe")
sha256sums=('7ace5a43983f10d6bdc9d9b6e17a1032ba6223118d389bd170df89b945a04a1e')

package() {
  cd Install/Data
  install -d "$pkgdir"/usr/share/games/quake2/baseq2

  # game files
  cp -r baseq2/{pak0.pak,players} "$pkgdir"/usr/share/games/quake2/baseq2/

  # documenation
  cp -r DOCS "$pkgdir"/usr/share/games/quake2/docs

  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s /usr/share/games/quake2/docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
