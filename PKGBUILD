# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>

pkgname=coveo-linq-git
pkgver=r48.17764bb
pkgrel=1
pkgdesc="A C++ library implementing LINQ operators similar to .NET's"
url='https://github.com/coveo/linq'
arch=('any')
license=('APACHE')
makedepends=('git' 'cmake>=3.6.0')
conflicts=('coveo-linq')
provides=('coveo-linq')
source=("git://github.com/coveo/linq.git")
sha512sums=('SKIP')

pkgver() {
  cd linq
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
  cd linq
  mkdir -p ${pkgdir}/usr/include
  cp -r lib/coveo ${pkgdir}/usr/include
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/coveo-linq-git/LICENSE
}
