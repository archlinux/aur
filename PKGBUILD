# Maintainer: Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributor: Jiawen Geng

pkgname=github-desktop
pkgver=0.7.0
pkgrel=4
pkgdesc="GUI for managing Git and GitHub."
arch=('x86_64')
url="https://desktop.github.com"
license=('MIT')
install=github-desktop.install
depends=('git' 'electron' 'nodejs')
    optdepends=('hub: CLI interface for GitHub.' )
makedepends=('libcurl-openssl-1.0')
source=(https://github.com/gengjiawen/desktop/releases/download/v${pkgver//_/-}/desktop_${pkgver}_amd64.deb)
md5sums=('452cd025172b9431e77a1e321f67cc7e')

prepare()   {
    sudo -v
}

package()   {
    ar x desktop_${pkgver}_amd64.deb
    tar xvf data.tar.xz
    sudo install -d "${pkgdir}/../../src/usr/share/" /usr/
    sudo install -d "${pkgdir}/../../src/opt/GithubDesktop" /opt/
}

