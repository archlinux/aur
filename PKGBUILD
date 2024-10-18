# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=7.3.0
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('x86_64')
license=('Apache-2.0')
optdepends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux-py311.zip"
        "https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('8c82e8d704f7f6477ed0495d33e477a3c1462f927de14f9fa5156843d3f3aa72fc9986087f6d34c7137ad3293c9b85e8030eabf8475581e4bde32cfadff1a030'
            'cfc7776e12281307fdbc69bad4fbe2572342466f4928e3e8f9c56020df4749003812586119b5a70bd008d74776c8bf157ae046c443d884793b8dec076e8f377a')

package() {
  install -Dm755 "${srcdir}/capa" "$pkgdir/opt/${_pkg}/capa"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkg}/LICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
