# Maintainer: Florian Moser <arch@famoser.ch>

pkgname=symfony-cli
pkgrel=1
pkgver=4.7.3
pkgdesc="The Symfony client helps developers create and manage Symfony applications."
url="https://symfony.com/"
arch=('x86_64')
license=('custom')
install=''
source=(
    "https://github.com/symfony/cli/releases/download/v${pkgver}/symfony_linux_amd64.gz"
)
noextract=('symfony_linux_amd64.gz')
sha256sums=('cb00c01903625d1f63bdce9603f24f36abea0ba88eaf111651d2fbace1b74a3a')
depends=('gzip')

prepare() {
    gunzip -d --force symfony_linux_amd64.gz
}

package() {
    install -D -m 755 "${srcdir}/symfony_linux_amd64" "${pkgdir}/usr/bin/symfony"
    ${pkgdir}/usr/bin/symfony self:shell-setup --silent
}
