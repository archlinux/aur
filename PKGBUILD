# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Chris van Dijk (quigybo) <quigybo at hotmail dot com>
# Contributor: Scott Olson <scott at scott-olson dot org>

pkgname=gist
pkgver=4.4.0
pkgrel=1
pkgdesc="Potentially the best command line gister"
url="https://github.com/defunkt/gist"
arch=('any')
license=('MIT')
depends=('ruby')
optdepends=(
  "xclip: put pasted gist's url into X selection automagically"
  "xsel: put pasted gist's url into X selection automagically"
)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/defunkt/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('e59f77d5461f8e9540294f13467feccd3b8f1840758d579a31aff700c4dd421d25d49305210c21f5165bdc966f7b5e2497f021789173b02157603299f05bcea4')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm 755 build/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 644 build/${pkgname}.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm 644 LICENSE.MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
