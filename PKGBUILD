# Maintainer: axionl <axionl@aosc.io>
pkgname=filemanager-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Web File Manager which can be used as a middleware or standalone app."
arch=('i386' 'x86_64')
url="https://github.com/hacdias/filemanager"
license=('Apache-2.0')
depends=('glibc')

source=('filemanager.service'
        'config.json'
        'README.txt')

source_i386=(linux-386-filemanager.tar.gz::https://github.com/hacdias/filemanager/releases/download/v$pkgver/linux-386-filemanager.tar.gz)
source_x86_64=(linux-amd64-filemanager.tar.gz::https://github.com/hacdias/filemanager/releases/download/v$pkgver/linux-amd64-filemanager.tar.gz)

md5sums=('9edb695128abd99b44f9d38fa3a8e5bc'
         '158da0caf1696c91157605a7a968883e'
         '2d3a0fe85d0564db2467a85b3da7c52c')
md5sums_i386=('66bddb8515e096c80b11bfb12e7ee965')
md5sums_x86_64=('9bf0768915505013c8214551da942f08')


package() {
  dir="$srcdir"
  install -Dm644 filemanager.service ${pkgdir}/usr/lib/systemd/system/filemanager.service
  install -Dm644 config.json ${pkgdir}/etc/filemanager/config.json
  install -Dm755 $dir/filemanager ${pkgdir}/usr/bin/filemanager
  install -Dm644 README.txt ${pkgdir}/usr/share/filemanager/storage/README.txt
  cat ${pkgdir}/usr/share/filemanager/storage/README.txt
}
