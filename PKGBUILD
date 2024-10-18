# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=7.2.0
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('x86_64')
license=('Apache-2.0')
optdepends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('66199846eebb4794e702512a0e1734903b10f6c75e093fb9d31cd975c34c5ee8b986a26c66c5210733bbda7fb3dbd7c2f9a618b05dc9242dff81566e7d1cd5b9'
            'cfc7776e12281307fdbc69bad4fbe2572342466f4928e3e8f9c56020df4749003812586119b5a70bd008d74776c8bf157ae046c443d884793b8dec076e8f377a')

package() {
  install -Dm755 "${srcdir}/capa" "$pkgdir/opt/${_pkg}/capa"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkg}/LICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
