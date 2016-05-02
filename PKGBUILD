# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.6.15
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
sha256sums_i686=('dd2c26d3fafe9fc83f429425cf00bceae857c6e5a96d79d8cd49a396cbd17fcd')
sha256sums_x86_64=('2a81faa54ed6c5e7c065444617fc999f0ab6d433e4e03a0ad599892e74ffff6b')
noextract=('_terraform')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
    install -Dm644 ${srcdir}/_terraform ${pkgdir}/usr/share/site-functions/_terraform
}
