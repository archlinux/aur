# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=7.0.1
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('x86_64')
license=('apache')
optdepends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('dfca7f2040f9d65cc49de5713be474274928acef3992b55b763c1aefbee6f24916a6f97402c1a8af2697ef1f038e594ed7aa6b341a3db83ee6f18c4d4a511d1f'
            'f8545e1acf803bc38f20b124df16e754a881021d8108e089acecc6f6c5d9fa4cae28698592e04811bbaf52ac0bf4cb9c8c1d819fed58ba3e9d36fe6c92bcba39')

package() {
  install -Dm755 "${srcdir}/capa" "$pkgdir/opt/${_pkg}/capa"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkg}/LICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
