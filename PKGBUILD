# Maintainer: axionl <axionl@aosc.io>
pkgname=filemanager-bin
pkgver=1.3.6
pkgrel=1
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
md5sums_i386=('d2faa1d7a31848cbbfff5e6970034651')
md5sums_x86_64=('8beebe6d90edadac21e4f1cb0c91d4a2')
md5sums_aarch64=('a0f8b7ce60dabbdea68f4bb31cd90177')

package() {
  dir="$srcdir"
  install -Dm644 filemanager.service ${pkgdir}/usr/lib/systemd/system/filemanager.service
  install -Dm644 config.json ${pkgdir}/etc/filemanager/config.json
  install -Dm755 $dir/filemanager ${pkgdir}/usr/bin/filemanager
  install -Dm755 LICENSE.md ${pkgdir}/usr/share/licenses/filemanager-bin/LICENSE
  install -Dm644 README.txt ${pkgdir}/usr/share/filemanager/storage/README.txt
  cat ${pkgdir}/usr/share/filemanager/storage/README.txt
}
