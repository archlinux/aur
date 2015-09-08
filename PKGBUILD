# Maintainer: Max Meyer <dev@fedux.org>
pkgname=systemd-docker
pkgver=0.2.0
pkgrel=2
pkgdesc="Wrapper for \"docker run\" to handle systemd quirks "
arch=("x86_64" "i686")
url="https://github.com/ibuildthecloud/systemd-docker"
license=('Apache')
makedepends=(go)
changelog=
source=("https://github.com/ibuildthecloud/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('50ec1876113ae349d38130297dd7e8de4c8d832ea2ac0e6089f3106a331c7e41')

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
