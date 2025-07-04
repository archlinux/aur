# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm
pkgver=1.2.0
pkgrel=1
depends=('pam')
makedepends=('git' 'gcc')
pkgdesc="A fully colorful customizable TUI display manager made in C. (build latest tag)"
arch=('any')
url="https://github.com/javalsai/lidm"
license=('GPL')
source=("tarball.tar.gz::https://github.com/javalsai/lidm/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0dffded5fcef45cb45fe88358b0cba8de04f614e323a9c6e4162f84b6e3a50b6')

build() {
    tar -xzf "tarball.tar.gz"
    cd "lidm-$pkgver"

    make CFLAGS="-O3"
}

package() {
    cd "lidm-$pkgver"
    make install DESTDIR="${pkgdir}"
}
