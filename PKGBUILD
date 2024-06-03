# Maintainer: Scott Alfter <scott@alfter.us>

pkgname=stl_normalize
_git_commit=9f60064ed329a90bc0f38caf270f19e438eace85
pkgver=release_1.01.r11.g9f60064
pkgrel=1
provides=("stl_normalize")
pkgdesc="a script to normalize and validate STL files"
arch=(any)
url="https://github.com/revarbat/stl_normalize"
license=("BSD-2")
depends=(python-numpy python-pyquaternion python-opengl)
makedepends=(git)
source=(
	"git+$url.git" 
	)
sha256sums=(
	"SKIP"
	)

pkgver() 
{
  cd "$pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() 
{
  cd "$pkgname"

  mkdir -p $pkgdir/usr/bin
  cp stl_normalize.py $pkgdir/usr/bin/stl_normalize
  chmod +x $pkgdir/usr/bin/stl_normalize
}
