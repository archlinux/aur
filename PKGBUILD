pkgname=gitxplain
pkgver=0.1.9
pkgrel=1
pkgdesc="AI-powered Git commit explainer CLI"
arch=('any')
url="https://github.com/guruswarupa/gitxplain"
license=('MIT')
depends=('nodejs')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('<SHA256_PLACEHOLDER>')

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}"
  tar -xzf "${srcdir}/${pkgname}-${pkgver}.tgz" -C "${srcdir}"
  cp -a "${srcdir}/package/." "${pkgdir}/usr/lib/${pkgname}/"

  chmod 755 "${pkgdir}/usr/lib/${pkgname}/cli/index.js"

  install -d "${pkgdir}/usr/bin"
  ln -sf "/usr/lib/${pkgname}/cli/index.js" "${pkgdir}/usr/bin/gitxplain"
  ln -sf "/usr/lib/${pkgname}/cli/index.js" "${pkgdir}/usr/bin/gitxplore"
}
