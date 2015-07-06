# Maintainer: Simone Baratta -- Conte91 <at> gmail <dot> com
pkgname=eigen-cmake-git
pkgver=r2.d334930
pkgrel=1
pkgdesc="Eigen configuration files for CMake"
arch=('any')
license=('custom:"Beerware"')
_reponame='eigen-cmake'
url="http://github.com/Conte91/$_reponame"
source=("git+https://github.com/Conte91/$_reponame.git")

pkgver() {
  cd "$srcdir/$_reponame"
  echo "r`git rev-list --count HEAD`.`git rev-parse --short HEAD`"
}

package() {
  cd $srcdir/$_reponame
  install -Dm644 FindEigen.cmake $pkgdir/usr/share/cmake-3.1/Modules/FindEigen.cmake
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('SKIP')
