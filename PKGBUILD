# Maintainer: Rodrigo Farias <rodrigofarias77@gmail.com>

pkgname=azure-cli-bin
pkgver=2.55.0
pkgrel=2
pkgdesc='Azure Command-Line Interface (Debian package)'
arch=('x86_64')
url='https://github.com/Azure/azure-cli'
license=('MIT')
depends=('python')
conflicts=('azure-cli' 'python-azure-cli')
source=("https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli/azure-cli_${pkgver}-1~bookworm_amd64.deb")
md5sums=('79588fb2f74e3d4c330d67d39a73e94d')

package () {
    cd "${pkgdir}"
    bsdtar -xf "${srcdir}/data.tar.xz"
    rm -r usr/share/doc
    find -name __pycache__ | xargs rm -r
}
