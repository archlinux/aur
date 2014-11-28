# Maintainer: Aaron Schaefer <aaron@elasticdog.com>
# Contributor: Erwin Van de Velde <erwin.vandevelde@gmail.com>
pkgname=rdiff-backup-devel
_pkgname=${pkgname%-*}
pkgver=1.3.3
pkgrel=1
pkgdesc='A utility for local/remote mirroring and incremental backups'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/rdiff-backup/'
license=('GPL')
depends=('python' 'librsync')
optdepends=('pylibacl: access control list support'
            'pyxattr: extended attribute support')
provides=('rdiff-backup')
conflicts=('rdiff-backup')
source=("http://savannah.nongnu.org/download/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('e3ec506c01e12b693adb79751daa7c63')
sha256sums=('ee030ce638df0eb1047cf72578e0de15d9a3ee9ab24da2dc0023e2978be30c06')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" || return 1
}
