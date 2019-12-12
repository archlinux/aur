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
sha256sums=('d8717433d2e511863bdbd5d239aeb9024a04cf0e34de155cf27e3a36f1cc9402')
depends=('gzip')

prepare() {
    gunzip -d --force symfony_linux_amd64.gz
}

package() {
    install -D -m 755 "${srcdir}/symfony_linux_amd64" "${pkgdir}/usr/bin/symfony"
    ${pkgdir}/usr/bin/symfony self:shell-setup --silent
}
