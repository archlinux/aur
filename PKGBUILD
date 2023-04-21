# Maintainer: f4iey <f4iey@f6kgl.ampr.org>
pkgname=fate-git
pkgver=r12.7ed9e57
pkgrel=1
pkgdesc="Minimal CLI JS8 software"
arch=('any')
license=('MIT')
url="https://github.com/rtmrtmrtmrtm/fate"
makedepends=('git')
depends=('fftw' 'libsndfile' 'portaudio')
source=($pkgname::"git+$url.git")

sha256sums=('SKIP')

build() {
    cd $srcdir/$pkgname
    make
}

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd $srcdir/$pkgname
    install -Dm755 "./fate" "$pkgdir/usr/bin/fate"
}
