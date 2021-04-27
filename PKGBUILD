# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=snallygaster-git
pkgver=r164.bfe8914
pkgrel=1
pkgdesc="Tool to scan for secret files on HTTP servers"
url="https://github.com/hannob/snallygaster"
arch=('any')
license=('GPL2')
depends=("python-urllib3" "python-beautifulsoup4" "python-dnspython")
conflicts=("snallygaster")
source=("snallygaster::git+https://github.com/hannob/snallygaster.git")
md5sums=('SKIP')

pkgver(){
    cd snallygaster
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -Dm755 "$srcdir/snallygaster/snallygaster" "$pkgdir/usr/bin/snallygaster"
	install -Dm644 "$srcdir/snallygaster/LICENSE" "$pkgdir/usr/share/licenses/snallygaster-git/LICENSE"
    install -Dm755 "$srcdir/snallygaster/TESTS.md" "$pkgdir/usr/share/doc/snallygaster/TESTS.md"
}
