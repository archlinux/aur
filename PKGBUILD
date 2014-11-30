# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Erwin Van de Velde <erwin.vandevelde@gmail.com>

pkgname=rdiff-backup-devel
_pkgname=${pkgname%-*}
pkgver=1.3.3
pkgrel=2
pkgdesc='A utility for local/remote mirroring and incremental backups'
arch=('any')
url='http://www.nongnu.org/rdiff-backup/'
license=('GPL')
depends=('python2' 'librsync')
optdepends=('pylibacl: access control list support'
            'pyxattr: extended attribute support')
provides=('rdiff-backup')
conflicts=('rdiff-backup')
source=(http://savannah.nongnu.org/download/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('e3ec506c01e12b693adb79751daa7c63')

package() {
  cd "${srcdir}"/$_pkgname-$pkgver

  python2 setup.py install --root="${pkgdir}"
}
