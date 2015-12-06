#Arch Linux PKGBUILD
#
#Maintainer: Fux <dfucini[at]gmail[dot]com>
#

pkgname=simple-backup
pkgver=1.2.3b.r0.ga2c4e54
pkgrel=2
pkgdesc='Simple backup script using rsync'
arch=('any')
url="https://github.com/Fuxino"
license=('GPL')
makedepends=('git')
depends=('rsync')
optdepends=('libnotify: display desktop notifications')
install=${pkgname}.install
source=(git+https://github.com/Fuxino/$pkgname.git
        config)
sha256sums=('SKIP'
            'd8b88cbb4e6d9cae68c1605496880065337484dff8ee4c06dce2578357e95574')

pkgver() 
{  
   cd "$pkgname"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
   install -Dm755 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
   install -Dm644 "${srcdir}/config" "${pkgdir}/etc/${pkgname}/config"
}
