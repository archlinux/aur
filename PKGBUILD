#Arch Linux PKGBUILD
#
#Maintainer: Daniele Fucini <dfucini@gmail.com>
#

pkgname=simple_backup
pkgver=3.0.0.r2.g3e5e3cb
pkgrel=1
pkgdesc='Simple backup script that uses rsync to copy files'
arch=('any')
url="https://github.com/Fuxino/simple_backup.git"
license=('GPL3')
makedepends=('git')
depends=('python3'
         'rsync'
         'python-dotenv')
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
   install -Dm644 "${srcdir}/${pkgname}/${pkgname}.config" "${pkgdir}/etc/${pkgname}/${pkgname}.config"
}
