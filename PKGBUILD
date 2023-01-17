# Maintainer: Lars Sjöström <(firstname) @ radicore.se>

pkgname=sapling-scm-bin
_realver=0.2.20221222-152408-ha6a66d09
pkgver="${_realver//-/.}"  # dashes aren't allowed in pkgver
pkgrel=1
epoch=1
pkgdesc='Sapling SCM is a cross-platform, highly scalable, Git-compatible source control system.'
arch=('x86_64')
license=('GPL2')
url='https://sapling-scm.com/'
depends=('curl' 'nodejs' 'python' 'github-cli')
optdepends=('watchman: for faster file watching')

options=('!strip')

source=("https://github.com/facebook/sapling/releases/download/$_realver/sapling_${_realver}_amd64.Ubuntu22.04.deb")
sha256sums=('50b802c5cca98505fd900171ced6cb8f5d24c8dc307d5206f1b61cdc30cc114c')

package() {
    cd "${srcdir}"
    tar --use-compress-program=unzstd -xvf data.tar.zst --no-same-owner -C "${pkgdir}"
    # Fix permissions
    chmod -R go-w "${pkgdir}"
}
