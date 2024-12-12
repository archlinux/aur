# Maintainer: Amin Vakil <info AT aminvakil DOT com>
# Contributor: Rene Hollander <mail@renehollander.at>

pkgname=cadvisor-bin
pkgver=0.49.2
pkgrel=1
pkgdesc="Analyzes resource usage and performance characteristics of running containers."
arch=("x86_64")
url="https://github.com/google/cadvisor"
license=("Apache2")

backup=('etc/conf.d/cadvisor')

source=("${pkgname}-${pkgver}::https://github.com/google/cadvisor/releases/download/v${pkgver}/cadvisor-v${pkgver}-linux-amd64"
        cadvisor.conf
        cadvisor.service)

sha256sums=('e8273ebfd18bac96834de3eb74a86bda4c2c6d6e9b4c924bdbf1f93e4e0bc24f'
            '785c5ad59f9cf5215afaba911a622dd09cc61749d17d8e46b449ccdece2a9787'
            'e6d6e399d0909a7aeb86b4beab52b8895760b740cf26d55f8b87003cb06b5f9b')

package() {
    install -Dm644 cadvisor.conf "$pkgdir"/etc/conf.d/cadvisor
    install -Dm644 cadvisor.service "$pkgdir"/usr/lib/systemd/system/cadvisor.service

    install -Dm755 "${pkgname}-${pkgver}" "$pkgdir"/usr/bin/cadvisor
}
