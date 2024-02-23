# Maintainer: ZreXoc <zeexoc@outlook.com>

pkgname=waywe
pkgver=0.1.0
pkgrel=1
pkgdesc="Dynamic wallpaper on wayland, based on wallpaper engine"
url="https://github.com/ZreXoc/waywe"
arch=('any')
license=('GPL3')
depends=('nodejs' 'tmux' 'mpvpaper-git' 'socat')
noextract=("${pkgname}-${pkgver}.tgz")
makedepends=('npm')
source=(
  "https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz"
)
sha256sums=('cb249edd8ed54ba3903a106fde0078e31a7b2b4cc2fdd46bc2709c312f2a2e62')

package() {
   npm install -g --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz" --unsafe-perm=true --allow-root
  find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
