# Maintainer: Theodoros Theodoridis <theodoridisgr@gmail.com>

pkgname=range-v3-git
pkgver=r1208.623e87d5
pkgrel=3
pkgdesc="Eric Niebler' C++ ranges library."
arch=('any')
url='https://github.com/ericniebler/range-v3'
license=('custom')
makedepends=('git')
source=("git+https://github.com/ericniebler/range-v3.git")
md5sums=('SKIP')

pkgver() {
  cd range-v3
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p  "$pkgdir/usr/include"
    cp -R "$srcdir/range-v3/include/"* "$pkgdir/usr/include"
	# install custom license
	install -Dm644 "$srcdir/range-v3/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 
}
