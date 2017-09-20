# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributor: Jiawen Geng

pkgname=github-desktop
pkgver=0.8.2_beta1
pkgrel=5
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64')
url="https://desktop.github.com"
license=('MIT')
install=github-desktop.install
depends=('git' 'electron' 'nodejs')
    optdepends=('hub: CLI interface for GitHub.' )
makedepends=('libcurl-openssl-1.0')
source=(https://github.com/gengjiawen/desktop/releases/download/v${pkgver//_/-}/desktop_${pkgver//_/-}_amd64.deb)
md5sums=('0c6779e6cb254500406ae64f0b84f0f4')

prepare()   {
    bsdtar -xJf data.tar.xz
}

package()   {
    cp --preserve=mode -r {opt,usr} "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

