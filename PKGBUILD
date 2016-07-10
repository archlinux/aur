# Maintainer: Norbert Pfeiler <norbert.pfeiler+aur ät gmail.com>

pkgname=cotire
_cotirever=1.7.8
_cmakever=3.6
_cmakegooduntil=3.7
pkgver=${_cotirever}_${_cmakever}
pkgrel=1
pkgdesc='CMake module to speed up builds. By fully automating techniques like precompiled header usage and single compilation unit builds for C and C++'
arch=(any)
license=('custom')
conflicts=("cmake>=$_cmakegooduntil") # the Modules dir changes every major release
url='https://github.com/sakra/cotire'
source=("https://github.com/sakra/cotire/archive/$pkgname-$_cotirever.tar.gz")
md5sums=('c5d41296dd179e390dc368686c8ccfdf')

package() {
  cd "$pkgname-$pkgname-$_cotirever"

  modules_dir="$pkgdir/usr/share/cmake-$_cmakever/Modules/"
  mkdir -p $modules_dir
  cp CMake/cotire.cmake $modules_dir

  license_dir="$pkgdir/usr/share/licenses/cotire/"
  mkdir -p $license_dir
  cp license $license_dir
}
