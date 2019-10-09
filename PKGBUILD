# Maintainer: Bogdan Burlacu <bogdan.burlacu@pm.me>
pkgname=kv-git
pkgver=r65.bf8bd29
pkgrel=1
pkgdesc="A C++ Library for Verified Numerical Computation"
arch=('any')
url="https://github.com/mskashi/kv"
license=('MIT')
depends=(boost)
makedepends=(git) # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/mskashi/kv.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    mkdir -p $pkgdir/usr/include
    cp -r kv $pkgdir/usr/include

    mkdir -p $pkgdir/usr/share/licenses/kv-git
    cp -r LICENSE.txt $pkgdir/usr/share/licenses/kv-git
}

