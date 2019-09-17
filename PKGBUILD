#Arch Linux PKGBUILD
#
#Maintainer: Daniele Fucini <dfucini@gmail.com>
#

pkgname=simple-backup
pkgver=2.1.0.r0.g2bcab8f
pkgrel=1
pkgdesc='Simple backup script that uses rsync to copy files'
arch=('any')
url="https://github.com/Fuxino/simple-backup.git"
license=('GPL3')
makedepends=('git')
depends=('python3'
         'rsync')
install=${pkgname}.install
source=(git+https://github.com/Fuxino/${pkgname}.git)
sha256sums=('SKIP')

pkgver() 
{  
   cd "$pkgname"
   git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
   install -Dm755 "${srcdir}/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
   install -Dm644 "${srcdir}/${pkgname}/config" "${pkgdir}/etc/${pkgname}/config"
}
