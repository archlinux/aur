# Contributor: Rainbow <rainbowtupperware@openmailbox.org>

pkgname=blackpearl
pkgver=0.0.6
pkgrel=1
pkgdesc="Watch movies and series from The Pirate Bay in your terminal"
arch=('any')
url="https://www.npmjs.com/package/blackpearl"
license=('WTFPL')
depends=('nodejs' 'npm' 'mpv')
makedepends=('npm')
options=(!emptydirs)
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
md5sums=('9c437265c7458a10f0df8ddaba1f5a1d')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}