# Maintainer: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Max Meyer <dev@fedux.org>

pkgname=systemd-docker
pkgver=0.2.1
pkgrel=1
pkgdesc="Wrapper for \"docker run\" to handle systemd quirks "
arch=("x86_64" "i686")
url="https://github.com/kageurufu/systemd-docker"
license=('Apache')
makedepends=(go)
changelog=
source=("https://github.com/kageurufu/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('76aa533ed8575c77dc1acd12adf1ad874b41edc51ca802f392f6f3e687942da5')

build() {
    cd "$pkgname-$pkgver"
    ./build
}

package() {
    cd "$pkgname-$pkgver"
    install -D -m 0755 bin/systemd-docker $pkgdir/usr/bin/systemd-docker
    install -D -m 644 example/coreos-nginx.service $pkgdir/usr/share/doc/examples/coreos-nginx.service
    install -D -m 644 example/nginx.service $pkgdir/usr/share/doc/examples/nginx.service
    install -D -m 644 image/startup.sh $pkgdir/usr/share/doc/examples/docker_image/startup.sh
    install -D -m 644 image/Dockerfile $pkgdir/usr/share/doc/examples/docker_image/Dockerfile
}
