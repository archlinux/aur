# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=swiftenv
pkgver=0.5.0
pkgrel=1
pkgdesc='Swift Version Manager'
arch=('any')
url='https://swiftenv.fuller.li/'
license=('custom')
depends=('bash')
source=("https://github.com/kylef/swiftenv/archive/$pkgver.tar.gz")
sha1sums=('f5f856dfe40c58718b1a42cc8fb0ddcc1fbc4f6a')

package() {
  cd "${srcdir}/swiftenv-${pkgver}"

  install -dm755 "${pkgdir}/usr/libexec/" "${pkgdir}/usr/completions/" "${pkgdir}/usr/share/swiftenv-build/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/swiftenv "${pkgdir}/usr/bin/swiftenv"
  install -Dm755 libexec/* "${pkgdir}/usr/libexec/"
  install -Dm644 completions/* "${pkgdir}/usr/completions/"
  install -Dm644 share/swiftenv-build/* "${pkgdir}/usr/share/swiftenv-build/"
}
