# Maintainer: Henrik Hodne <henrik@hodne.io>
# Contributor: Duncan K. <duncank@fastmail.fm>

pkgname=terraform-bin
pkgver=0.7.0
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
sha256sums_i686=('e22a756ffaec39a6635f253ebd8389ed19dd13c0e7151cdf11779cffa411754b')
sha256sums_x86_64=('a196c63b967967343f3ae9bb18ce324a18b27690e2d105e1f38c5a2d7c02038d')
noextract=('_terraform')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${srcdir}/terraform-* ${pkgdir}/usr/bin
    install -Dm644 ${srcdir}/_terraform ${pkgdir}/usr/share/site-functions/_terraform
}
