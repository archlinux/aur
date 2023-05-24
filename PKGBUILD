# Maintainer: Rodrigo Farias <rodrigofarias77@gmail.com>

pkgname=azure-cli-bin
pkgver=2.49.0
pkgrel=2
pkgdesc='Azure Command-Line Interface (Ubuntu package)'
arch=('x86_64')
url='https://github.com/Azure/azure-cli'
license=('MIT')
depends=('python')
conflicts=('azure-cli' 'python-azure-cli')
source=("https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli/azure-cli_${pkgver}-1~jammy_amd64.deb")
md5sums=('1dd769521fa9fc52698931f285336c34')

package () {
    cd "${pkgdir}"
    bsdtar -xf "${srcdir}/data.tar.zst"
    rm -r usr/share/doc
    find -name __pycache__ | xargs rm -r
}
