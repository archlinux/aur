# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=swiftenv
pkgver=1.0.0
pkgrel=1
pkgdesc='Swift Version Manager'
arch=('any')
url='https://swiftenv.fuller.li/'
license=('custom')
depends=('bash')
source=("https://github.com/kylef/swiftenv/archive/$pkgver.tar.gz")
sha1sums=('a81f1b3838b2da1fd2fbdea43406f05cdee5d7b0')

package() {
  cd "${srcdir}/swiftenv-${pkgver}"

  install -dm755 "${pkgdir}/usr/libexec/" "${pkgdir}/usr/completions/" "${pkgdir}/usr/share/swiftenv-build/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/swiftenv "${pkgdir}/usr/bin/swiftenv"
  install -Dm755 libexec/* "${pkgdir}/usr/libexec/"
  install -Dm644 completions/* "${pkgdir}/usr/completions/"
  install -Dm644 share/swiftenv-build/* "${pkgdir}/usr/share/swiftenv-build/"
}
