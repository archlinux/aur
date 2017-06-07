# Maintainer: Jonathan Wright <jon@than.io>
# Contributor: Yuval Adam <yuval@y3xz.com>
# Contributor: Duncan K. <duncank@fastmail.fm>
# Contributor: Henrik Hodne <henrik@hodne.io>

pkgname=terraform-bin
pkgver=0.9.7
pkgrel=1
pkgdesc="Tool for building, changing, and versioning infrastructure safely and efficiently"
url='http://www.terraform.io/'
arch=('i686' 'x86_64')
license=('MPL')
conflicts=('terraform')

source=("https://raw.githubusercontent.com/hashicorp/terraform/v${pkgver}/contrib/zsh-completion/_terraform")
source_i686=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_386.zip")
source_x86_64=("https://releases.hashicorp.com/terraform/${pkgver}/terraform_${pkgver}_linux_amd64.zip")
sha256sums=('4efcb7d7a231ea5e1f9bc9c06c3abfb6825e907883f88a8790e590548353da93')
sha256sums_i686=('4adddba02c54df7dfad760b5e08eeca9756f49c0df2d86bf157c47e85b9f4ed0')
sha256sums_x86_64=('df6aecbddca9ea4e0f32290ed5efb92c1b4173d8afd1d95470424f635c41d242')
noextract=('_terraform')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${pkgdir}/usr/bin
    install -Dm644 ${srcdir}/_terraform ${pkgdir}/usr/share/site-functions/_terraform
}
