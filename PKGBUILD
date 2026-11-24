# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=groq-cli
_npmname=groq-cli
pkgver=0.5.0
pkgrel=1
pkgdesc="Run GROQ queries from the command line"
arch=('any')
url="https://github.com/sanity-io/groq-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/groq-cli-${pkgver}.tgz")
noextract=("${pkgname}-${pkgver}.tgz")
sha256sums=('1998b2027ae8f84fb0f11a3fc0ab856b881a6b366d0b22e804c9477243354ce7')

package() {
  npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  chown -R root:root "${pkgdir}"
  install -Dm644 "${pkgdir}/usr/lib/node_modules/${_npmname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
