# Maintainer: Jonathan Raffre <nk+aur@nyuu.eu>
# Contributor: Yuval Adam <yuval@y3xz.com>
# Contributor: Duncan K. <duncank@fastmail.fm>
# Contributor: Henrik Hodne <henrik@hodne.io>

pkgname=terraform-bin
pkgver=0.7.13
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
sha256sums_i686=('69eeeec837837ff5c7c796a86f7ac5b1fb442220c228b4358b450cd906f8a3c3')
sha256sums_x86_64=('5a4f762a194542d38406b9b92c722b57f7910344db084e24c9c43d7719f4aa18')
noextract=('_terraform')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${pkgdir}/usr/bin
    install -Dm644 ${srcdir}/_terraform ${pkgdir}/usr/share/site-functions/_terraform
}
