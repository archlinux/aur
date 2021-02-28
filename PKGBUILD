# Maintainer: Storm Dragon <stormdragon2976@gmail.com>
pkgname=sndup-linux-git
pkgver=r6.aa62c5f
pkgrel=1
pkgdesc="A client to upload audio files to the sndup.net autdio sharing service."
arch=('any')
url="http://git.2mb.codes/~stormdragon2976/sndup-linux"
license=('WTFPL')
depends=('bash' 'curl' 'xidel')
makedepends=('git')
optdepends=('xclip: Copy links to the clipboard')

source=(git+https://git.2mb.codes/~stormdragon2976/sndup-linux)
md5sums=('SKIP')

pkgver()
{
  cd "sndup-linux"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
package()
 {
  cd "$srcdir/sndup-linux"
  install -d "$pkgdir/usr/bin"
install -d "$pkgdir/usr/share/licenses/${pkgname}"
  install -m755 "sndup" "$pkgdir/usr/bin"
  install -m666 "license.txt" "$pkgdir/usr/share/licenses/${pkgname}"
  }

