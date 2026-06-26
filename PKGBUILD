# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Rene Hollander <mail@renehollander.at>

pkgname=cadvisor-bin
pkgver=0.60.3
pkgrel=1
pkgdesc="Analyzes resource usage and performance characteristics of running containers."
arch=("x86_64")
url="https://github.com/google/cadvisor"
license=("Apache-2.0")

backup=('etc/conf.d/cadvisor')

source=("${pkgname}-${pkgver}::https://github.com/google/cadvisor/releases/download/v${pkgver}/cadvisor-v${pkgver}-linux-amd64"
        cadvisor.conf
        cadvisor.service)

sha256sums=('5ac0aead85c2002120b4e4a1f00a127e438fa252ab8e87a5a2b6eaf7044d8ced'
            '785c5ad59f9cf5215afaba911a622dd09cc61749d17d8e46b449ccdece2a9787'
            'e6d6e399d0909a7aeb86b4beab52b8895760b740cf26d55f8b87003cb06b5f9b')

package() {
    install -Dm644 cadvisor.conf "$pkgdir"/etc/conf.d/cadvisor
    install -Dm644 cadvisor.service "$pkgdir"/usr/lib/systemd/system/cadvisor.service

    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir"/usr/bin/cadvisor
}
