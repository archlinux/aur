# Maintainer: Jah Way <jahway603 at protonmail dot com>

pkgname=capa-bin
_pkg=capa
pkgver=7.1.0
pkgrel=1
pkgdesc="The FLARE team's open-source tool to identify capabilities in executable files"
url="https://github.com/mandiant/capa"
arch=('x86_64')
license=('apache')
optdepends=('python2')
conflicts=('capa')
source=("$url/releases/download/v$pkgver/${_pkg}-v$pkgver-linux.zip"
        "https://raw.githubusercontent.com/mandiant/capa/master/LICENSE.txt")
sha512sums=('24216d0d9422351a0d74dee5c349eddbba1062c27c1b0e7c0e05521e69ec6075989a0574f0364fbf322180de0294a72acc99f0c01ad93ee1e1192184173d49ba'
            'cfc7776e12281307fdbc69bad4fbe2572342466f4928e3e8f9c56020df4749003812586119b5a70bd008d74776c8bf157ae046c443d884793b8dec076e8f377a')

package() {
  install -Dm755 "${srcdir}/capa" "$pkgdir/opt/${_pkg}/capa"
  install -Dm644 "${srcdir}/LICENSE.txt" "$pkgdir/usr/share/licenses/${_pkg}/LICENSE"
 
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/${_pkg}/capa "${pkgdir}/usr/bin"
}
