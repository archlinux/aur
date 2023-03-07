# Maintainer: Rodrigo Farias <rodrigofarias77@gmail.com>

pkgname=azure-cli-bin
pkgver=2.46.0
pkgrel=3
pkgdesc='Azure Command-Line Interface (Ubuntu package)'
arch=('x86_64')
url='https://github.com/Azure/azure-cli'
license=('MIT')
depends=('python')
conflicts=('azure-cli' 'python-azure-cli')
source=("https://packages.microsoft.com/repos/azure-cli/pool/main/a/azure-cli/azure-cli_${pkgver}-1~jammy_amd64.deb")
md5sums=('560251e2e1f3acb9866adcc573916c1f')

package () {
    cd "${pkgdir}"
    bsdtar -xf "${srcdir}/data.tar.zst"
    rm -r usr/share/doc
    find -name __pycache__ | xargs rm -r
}
