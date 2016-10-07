# Maintainer: Jonathan Raffre <nk+aur@nyuu.eu>
# Contributor: Yuval Adam <yuval@y3xz.com>
# Contributor: Duncan K. <duncank@fastmail.fm>
# Contributor: Henrik Hodne <henrik@hodne.io>

pkgname=terraform-bin
pkgver=0.7.5
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
sha256sums_i686=('83ace94b800db15d32fbb9a6d6f2fc25ed5c0936fa2cb700221dd31bf071a156')
sha256sums_x86_64=('7def82015b3a9a1bab13b4548e4c8d4ac960322a815cff7d9ebf76ef74a4cb34')
noextract=('_terraform')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${pkgdir}/usr/bin
    install -Dm644 ${srcdir}/_terraform ${pkgdir}/usr/share/site-functions/_terraform
}
