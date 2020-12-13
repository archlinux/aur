# Maintainer:  Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Chris Down <chris@chrisdown.name>
# Contributor: Dave Reisner <d@falconindy.com>

set -u
pkgname='pkgbuild-introspection'
pkgver='9'
pkgrel='1'
pkgdesc='Tool for generating .SRCINFO files (mksrcinfo)'
arch=('any')
url="https://github.com/falconindy/${pkgname}"
license=('MIT')
depends=('bash' 'pacman')
#makedepends=('git')
#provides=('pkgbuild-introspection')
#conflicts=('pkgbuild-introspection-git')
source=("pbi-${pkgver}.tgz::https://github.com/falconindy/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a12d3c05702a6407fa050b3d74d0c7d3')
sha256sums=('c35676b2828369cb4c1c84ba6b4f7c77334452455619591a405c80aaae0321b8')

build() {
  set -u
  cd -- "${srcdir?}/${pkgname}-${pkgver}"
  make
  set +u
}

package() {
  set -u
  cd -- "${srcdir?}/${pkgname}-${pkgver}"
  make install PREFIX='/usr' DESTDIR="${pkgdir}"
  set +u
}
set +u
