# Maintainer: axionl <axionl@aosc.io>
pkgname=filebrowser-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Web File Manager which can be used as a middleware or standalone app."
arch=('x86_64')
url="https://github.com/filebrowser/filebrowser"
license=('Apache')
depends=('glibc')
backup=('etc/filebrowser/config.json'
	'usr/share/filebrowser/storage/README.txt'
	'usr/lib/systemd/system/filebrowser.service')
source=('filebrowser.service'
        'config.json'
        'README.txt'
	'https://raw.githubusercontent.com/hacdias/filebrowser/master/LICENSE.md')

source_x86_64=(linux-amd64-filebrowser.tar.gz::https://github.com/filebrowser/filebrowser/releases/download/v$pkgver/linux-amd64-filebrowser.tar.gz)

md5sums=('8c32a68ea6e6c9079f989bf72bb37ba9'
         'd47072829df221f4ac29b9f299d964f0'
         '93513176e4f94536c504e5d5045e70f8'
         'd92e60ee98664c54f68aa515a6169708')
md5sums_x86_64=('8835461bca3cc7d9141d436c310168a1')

package() {
  dir="$srcdir"
  install -Dm644 filebrowser.service ${pkgdir}/usr/lib/systemd/system/filebrowser.service
  install -Dm644 config.json ${pkgdir}/etc/filebrowser/config.json
  install -Dm755 $dir/filebrowser ${pkgdir}/usr/bin/filebrowser
  install -Dm755 LICENSE.md ${pkgdir}/usr/share/licenses/filebrowser-bin/LICENSE
  install -Dm644 README.txt ${pkgdir}/usr/share/filebrowser/storage/README.txt
  cat ${pkgdir}/usr/share/filebrowser/storage/README.txt
}
