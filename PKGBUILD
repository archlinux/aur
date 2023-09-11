# Maintainer: Bruno Miguel <bruno@privacyrequired.com>

pkgname=yam-formatter-git
_shortpkgname=yam-formatter
pkgdesc='A sweet little formatter for YAML'
arch=('x86_64' 'aarch64')
url='https://github.com/chainguard-dev/yam'
pkgrel=2
license=('Apache-2.0')
makedepends=('go' 'git')
source=('git+https://github.com/chainguard-dev/yam')
md5sums=('SKIP')
provides=($_shortpkgname)
conflicts=($_shortpkgname)
pkgver=r58.8d3c53b

pkgver() {
    cd yam
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}


build() {
	cd yam
	go build
}

package() {
	cd yam
	install -Dm755 yam "$pkgdir/usr/bin/yam-formatter"
}

