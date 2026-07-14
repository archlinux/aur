# Maintainer: iLoveVideoEditor <dev@ilovevideoeditor.com>
pkgname=ilovevideoeditor
pkgver=1.0.0
pkgrel=1
pkgdesc="Render videos from VideoJSON specs in your terminal or CI"
arch=('any')
url="https://ilovevideoeditor.com"
license=('MIT')
depends=('nodejs>=18')
makedepends=('npm')
source=("https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz")
sha256sums=('af5e0ef151771b8a72da5c170fd7db9573ce138973b7f39bf1ec4bec753190e9')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
  npm install --global --prefix "${pkgdir}/usr" \
    --cache "${srcdir}/npm-cache" \
    "${srcdir}/${pkgname}-${pkgver}.tgz"

  # npm drops symlinks pointing outside the package dir; fix permissions
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
}
