# Maintainer: axionl <axionl@aosc.io>
pkgname=filemanager-bin
pkgver=1.3.11
pkgrel=2
pkgdesc="Web File Manager which can be used as a middleware or standalone app."
arch=('i386' 'x86_64' 'aarch64')
url="https://github.com/hacdias/filemanager"
license=('Apache')
depends=('glibc')
backup=('etc/filemanager/config.json'
	'usr/share/filemanager/storage/README.txt'
	'usr/lib/systemd/system/filemanager.service')
source=('filemanager.service'
        'config.json'
        'README.txt'
	'https://raw.githubusercontent.com/hacdias/filemanager/master/LICENSE.md')

source_i386=(linux-386-filemanager.tar.gz::https://github.com/hacdias/filemanager/releases/download/v$pkgver/linux-386-filemanager.tar.gz)
source_x86_64=(linux-amd64-filemanager.tar.gz::https://github.com/hacdias/filemanager/releases/download/v$pkgver/linux-amd64-filemanager.tar.gz)
source_aarch64=(linux-arm64-filemanager.tar.gz::https://github.com/hacdias/filemanager/releases/download/v$pkgver/linux-arm64-filemanager.tar.gz)

md5sums=('d456780038b3b96878c719786cc2e526'
         '158da0caf1696c91157605a7a968883e'
         '2d3a0fe85d0564db2467a85b3da7c52c'
         'd92e60ee98664c54f68aa515a6169708')
md5sums_i386=('59fce346ae8d449e4c8026a84f02e7d3')
md5sums_x86_64=('0e5b3103aa921e76ac3c23edd5540739')
md5sums_aarch64=('be7c04f0db14b1e3c73fc52fe1408566')

package() {
  dir="$srcdir"
  install -Dm644 filemanager.service ${pkgdir}/usr/lib/systemd/system/filemanager.service
  install -Dm644 config.json ${pkgdir}/etc/filemanager/config.json
  install -Dm755 $dir/filemanager ${pkgdir}/usr/bin/filemanager
  install -Dm755 LICENSE.md ${pkgdir}/usr/share/licenses/filemanager-bin/LICENSE
  install -Dm644 README.txt ${pkgdir}/usr/share/filemanager/storage/README.txt
  cat ${pkgdir}/usr/share/filemanager/storage/README.txt
}
