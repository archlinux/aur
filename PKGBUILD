# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributor: Jiawen Geng

pkgname=github-desktop
pkgver=1.0.4_beta0
pkgrel=2
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64')
url="https://desktop.github.com"
license=('MIT')
install=github-desktop.install
depends=('gnome-keyring' 'git' 'electron' 'nodejs' 'libcurl-compat' 'libcurl-gnutls')
    optdepends=('hub: CLI interface for GitHub.')
makedepends=('libcurl-openssl-1.0')
source=(https://github.com/gengjiawen/desktop/releases/download/v${pkgver//_/-}/desktop_${pkgver//_/-}_amd64.deb)
md5sums=('e5285a06a6ab201f36b49f877f87abbc')

prepare()   {
    bsdtar -xJf data.tar.xz
}

package()   {
    cp --preserve=mode -r {opt,usr} "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +
}

