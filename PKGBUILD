# Maintainer: Bart Libert <aur@bart.libert.email>

pkgname=git-br
pkgver=1.1.2
pkgrel=2
pkgdesc="Shows current git branches and their descriptions"
arch=('any')
url='https://github.com/bahmutov/git-branches'
license=('MIT')
depends=('bash')
makedepends=('npm')
optdepends=('git')
source=("${pkgname}-${pkgver}.tgz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('51da7e79b98edac56a706f55c8d98d0589e1a065f851bebf2b429fb0d60795f2')

package() {
  npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"
  install -Dm644 "${srcdir}/git-branches-${pkgver}/LICENSE-MIT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
