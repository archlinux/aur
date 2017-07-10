# Maintainer: Theodoros Theodoridis <theodoridisgr@gmail.com>

pkgname=range-v3-git
pkgver=0.3.0.r5.gfc333d91
pkgrel=1
pkgdesc="Eric Niebler' C++ ranges library."
arch=('any')
url='https://github.com/ericniebler/range-v3'
license=('custom')
makedepends=('git')
source=("git+https://github.com/ericniebler/range-v3.git")
md5sums=('SKIP')

pkgver() {
  cd range-v3
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p  "$pkgdir/usr/include"
    cp -R "$srcdir/range-v3/include/"* "$pkgdir/usr/include"
	# install custom license
	install -Dm644 "$srcdir/range-v3/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
