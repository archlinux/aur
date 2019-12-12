# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=1
pkgver=4.11.3
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('custom')
install=''
source=(
    "https://github.com/symfony/cli/releases/download/v${pkgver}/symfony_linux_amd64.gz"
)
noextract=('symfony_linux_amd64.gz')
sha256sums=('f89cc5c8b56ae44d8c1334f91cea9068d80a5c870b9c80a4e396dbab6b13de98')
depends=('gzip')

prepare() {
    gunzip -d --force symfony_linux_amd64.gz
}

package() {
    install -D -m 755 "${srcdir}/symfony_linux_amd64" "${pkgdir}/usr/bin/symfony"
    ${pkgdir}/usr/bin/symfony self:shell-setup --silent
}
