# Maintainer: Jan-Erik Rediger <badboy at archlinux dot us>
# Contributor: Sandro Munda <munda.sandro@gmail.com>

pkgname=ghi-git
pkgver=1.0.3.1.gb8dad32
pkgrel=1
pkgdesc="GitHub Issues on the command line."
arch=(any)
url="http://github.com/stephencelis/ghi"
license=('MIT')
provides=('ghi')
conflicts=('ghi')
depends=('ruby')
source=("git://github.com/stephencelis/ghi.git")
sha1sums=('SKIP')

_gitname="ghi"

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --tags | sed 's/-/./g'
}

package() {
  cd "$_gitname"

  install -Dm755 ghi ${pkgdir}/usr/bin/ghi
  install -Dm644 man/ghi.1 \
    ${pkgdir}/usr/share/man/man1/ghi.1
  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
