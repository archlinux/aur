# Maintainer: Hownioni <honeyhownioni at gmail dot com>
pkgname=dra-cla-git
pkgver=r34.cf8a90c
pkgrel=1
pkgdesc="A cli to browse and watch Korean Drama, Chinese drama."
arch=('any')
url="https://github.com/CoolnsX/dra-cla"
license=('GPL3')
depends=('fzf' 'grep' 'sed' 'curl' 'openssl' 'mpv' 'aria2' 'ffmpeg')
makedepends=('git')
#provides=("${pkgname%-git}")
#conflicts=("${pkgname%-git}")
source=('dra-cla::git+https://github.com/CoolnsX/dra-cla.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm755 "./dra-cla" "$pkgdir/usr/bin/dra-cla"
}
