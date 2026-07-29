# Maintainer: Burak Civelek <burakcivelekk61@gmail.com>

pkgname=docker-model-plugin-bin
pkgver=1.2.6
pkgrel=1
pkgdesc="Docker Model Runner CLI plugin (prebuilt binary)"
arch=('x86_64')
url='https://github.com/docker/model-runner'
license=('Apache-2.0')
depends=('docker')

source=("docker-model-plugin_${pkgver}.deb::https://download.docker.com/linux/ubuntu/dists/noble/pool/stable/amd64/docker-model-plugin_${pkgver}-1~ubuntu.24.04~noble_amd64.deb")

sha256sums=('99e5c1e278ff73f4a950f39dfa4499db949424cc9002e4ba47e21ed951cd0d8e')

package() {
    cd "$srcdir"

    ar x "docker-model-plugin_${pkgver}.deb"
    tar -xf data.tar.*

    install -Dm755 \
        usr/libexec/docker/cli-plugins/docker-model \
        "$pkgdir/usr/lib/docker/cli-plugins/docker-model"
}
