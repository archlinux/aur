# Maintainer: Ari Mizrahi <codemunchies at debugsecurity dot com>

pkgname=maltrieve
pkgver=git
pkgrel=1
pkgdesc="Retrieves malware directly from sources malc0de, malware black list, malware domain list, malware patrol, sacour.cn, vx vault, urlqery, and cleanmx"
arch=('any')
url='https://github.com/technoskald/maltrieve'
license=('GPL3')
makedepends=('git')
depends=('python2' 'python2-beautifulsoup4' 'python2-lxml')
source=('git+https://github.com/technoskald/maltrieve')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"

  # Base directories.
  install -dm755 "$pkgdir/usr/share/$pkgname"
  install -dm755 "$pkgdir/usr/bin"

  cp *.py *.sh "$pkgdir/usr/share/$pkgname"
  
  cat > "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/sh
cd /usr/share/maltrieve
python2 maltrieve.py "\$@"
EOF
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
