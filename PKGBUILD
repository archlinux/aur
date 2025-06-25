# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

pkgname=chkufsd-bin
pkgver=r279255.b1403
pkgrel=1
pkgdesc='Combined utility for checking and fixing NTFS / HFS+ file systems'
url='https://www.paragon-software.com/technologies/ufsd.html'
arch=('i686' 'x86_64')
license=('LGPL-3.0-or-later')
conflicts=('chkufsd' 'chkntfs' 'chkhfs')
provides=('chkufsd' 'chkntfs' 'chkhfs')
source=("https://archive.org/download/tools_202401/tools.zip"
        "https://www.gnu.org/licenses/lgpl-3.0.txt")
sha256sums=('94835f5762de29febcbe88b3735eafe17adb1997b6b484f6b39c7a14476a936c'
            'e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118')

package() {
  install -Dm755 "$srcdir/disk tools/chkufsd" -t "$pkgdir/usr/bin"
  ln -s "/usr/bin/chkufsd" "$pkgdir/usr/bin/chkntfs"
  ln -s "/usr/bin/chkufsd" "$pkgdir/usr/bin/chkhfs"
  install -Dm644 "$srcdir/lgpl-3.0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
