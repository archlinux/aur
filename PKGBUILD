# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cotire
_cotirever=1.8.0
_cmakever=3.16
_cmakegooduntil=3.17
pkgver=${_cotirever}_${_cmakever}
pkgrel=1
pkgdesc='CMake module to speed up builds. By fully automating techniques like precompiled header usage and single compilation unit builds for C and C++'
arch=(any)
license=('custom')
conflicts=("cmake>=$_cmakegooduntil") # the Modules dir changes every major release
url='https://github.com/sakra/cotire'
source=("https://github.com/sakra/cotire/archive/$pkgname-$_cotirever.tar.gz")
md5sums=('d3e408a208adcc6d9cf5b052df2f2fda')

package() {
  cd "$pkgname-$pkgname-$_cotirever"

  modules_dir="$pkgdir/usr/share/cmake-$_cmakever/Modules/"
  mkdir -p $modules_dir
  cp CMake/cotire.cmake $modules_dir

  license_dir="$pkgdir/usr/share/licenses/cotire/"
  mkdir -p $license_dir
  cp license $license_dir
}
