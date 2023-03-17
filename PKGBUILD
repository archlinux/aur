# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=5.0.0
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('x86_64')
license=('apache')
optdepends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha256sums=('843dbed824c1cdf5a74f1f063dc63272cedc54b58a748a42f874db80627e345a'
            '275dbf7cc15d9c826b03638277eae17bb827fbdd5891a96a44708cf3abec458d')

package() {
  install -Dm755 "${srcdir}/capa" "$pkgdir/opt/${_pkg}/capa"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkg}/LICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
