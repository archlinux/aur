# Maintainer: Jonathan Raffre <nk+aur@nyuu.eu>
# Contributor: Yuval Adam <yuval@y3xz.com>
# Contributor: Duncan K. <duncank@fastmail.fm>
# Contributor: Henrik Hodne <henrik@hodne.io>

pkgname=terraform-bin
pkgver=0.8.1
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
sha256sums_i686=('beafc708c1f2ec65447206e75abd0ef3367981d6293a6e412c0db41fab66303d')
sha256sums_x86_64=('da98894a79b7e97ddcb2a1fed7700d3f53c3660f294fb709e1d52c9baaee5c59')
noextract=('_terraform')

package() {
    install -d ${pkgdir}/usr/bin
    install -Dm755 ${srcdir}/terraform ${pkgdir}/usr/bin
    install -Dm644 ${srcdir}/_terraform ${pkgdir}/usr/share/site-functions/_terraform
}
