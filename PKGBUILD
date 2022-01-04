# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=3.0.3
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('x86_64')
license=('apache')
optdepends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha256sums=('50f64c679569978b65101e1597acf235ef3ba3d99ca3baddb551bc50202985e7'
            '275dbf7cc15d9c826b03638277eae17bb827fbdd5891a96a44708cf3abec458d')

package() {
  install -Dm755 "${srcdir}/capa" "$pkgdir/opt/${_pkg}/capa"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkg}/LICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
