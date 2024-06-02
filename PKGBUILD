# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=7.0.1
pkgrel=2
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('x86_64')
license=('apache')
optdepends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('dfca7f2040f9d65cc49de5713be474274928acef3992b55b763c1aefbee6f24916a6f97402c1a8af2697ef1f038e594ed7aa6b341a3db83ee6f18c4d4a511d1f'
            'cfc7776e12281307fdbc69bad4fbe2572342466f4928e3e8f9c56020df4749003812586119b5a70bd008d74776c8bf157ae046c443d884793b8dec076e8f377a')

package() {
  install -Dm755 "${srcdir}/capa" "$pkgdir/opt/${_pkg}/capa"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkg}/LICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
