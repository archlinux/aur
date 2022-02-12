# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=swiftenv
pkgver=1.5.0
pkgrel=1
pkgdesc='Swift Version Manager'
arch=('any')
url='https://swiftenv.fuller.li/'
license=('custom')
depends=('bash')
source=("https://github.com/kylef/swiftenv/archive/$pkgver.tar.gz")
sha256sums=('4452b47c2d256c4efbfc3870cd9e1e0f1aa5c5821e5b590b97547cd10bdbc0ac')

package() {
  cd "${srcdir}/swiftenv-${pkgver}"

  install -dm755 "${pkgdir}/usr/libexec/" "${pkgdir}/usr/completions/" "${pkgdir}/usr/share/swiftenv-build/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/swiftenv "${pkgdir}/usr/bin/swiftenv"
  install -Dm755 libexec/* "${pkgdir}/usr/libexec/"
  install -Dm644 completions/* "${pkgdir}/usr/completions/"
  install -Dm644 share/swiftenv-build/* "${pkgdir}/usr/share/swiftenv-build/"
}
