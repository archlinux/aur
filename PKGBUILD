# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=3.5.2
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud>=21' 'nextcloud<25')
makedepends=('npm' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha512sums=('22df35fe0760d3a7307b52a1d6a9e789d2bdf7bbecfe0d075fc5ad4090e575c688ed736d531e19590ffc9264a26c60751de5686b020fc52b7063a445a602f4cc')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make -j1
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
