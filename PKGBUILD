# Maintainer: Carlos Galindo <arch -at- cgj.es>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nextcloud-app-polls
pkgver=2.0.4
pkgrel=1
pkgdesc="Poll app for Nextcloud"
arch=('any')
url="https://github.com/nextcloud/polls"
license=('AGPL3')
depends=('nextcloud>=20.0.0')
makedepends=('npm' 'composer')
source=("polls-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('b2fb87d800e8a27d3b7d380faea8b2a63f32603ccaa8c2337b006c1c15ef4c38c76ddb25b5566898fc2fce408532b082bc50ccfaaa24d06e6b76237bde7be49e')

build() {
    cd "${srcdir}/polls-${pkgver}"
    make -j1
}

package() {
    install -d "${pkgdir}/usr/share/webapps/nextcloud/apps"
    cp -a "${srcdir}/polls-${pkgver}/build/source/polls" \
        "${pkgdir}/usr/share/webapps/nextcloud/apps"
}
