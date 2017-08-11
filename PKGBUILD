# Mantainer: M0Rf30
pkgname=clonezilla-experimental
_name=clonezilla
pkgver=3.27.17
pkgrel=1
pkgdesc="The Free and Open Source Software for Disk Imaging and Cloning"
arch=('i686' 'x86_64')
url="http://clonezilla.org/"
license=('GPL')
depends=('drbl' 'partclone' 'ntfs-3g' 'partimage' 'pigz' 'sshfs' 'parted'
         'gptfdisk' 'dosfstools' 'gzip' 'bzip2' 'pbzip2' 'lbzip2' 'lrzip'
         'xz' 'pixz' 'lzop' 'ecryptfs-utils')
backup=('etc/drbl/drbl-ocs.conf')
provides=('clonezilla')
source=(http://free.nchc.org.tw/drbl-core/src/unstable/$_name-$pkgver.tar.xz
        usrbin.patch)

prepare() {
  cd $_name-$pkgver

  patch -Np0 -i "$srcdir"/usrbin.patch
}

package() {
  cd $_name-$pkgver

  make DESTDIR="$pkgdir" install  
}

md5sums=('523add3bb92d230fcbf0162849d27685'
         'a976c9209f7bbccd352a9d0a5c8b41ae')
