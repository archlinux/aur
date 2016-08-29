# Maintainer: Tom Richards <tom@tomrichards.net>
pkgname=rockyou
pkgver=1.2
pkgrel=1
pkgdesc='The popular "rockyou" password list from OWASP SecLists project'
arch=('any')
url='https://www.owasp.org/index.php/OWASP_SecLists_Project'
license=('CCPL:by-sa')
source=('https://raw.githubusercontent.com/danielmiessler/SecLists/1.2/Passwords/rockyou.txt.tar.gz')
sha256sums=('47c070a029bcdb4cbd0e02c69fed136ef46dce4048ddbadf177daa5e885b8172')

package() {
    mkdir -p "$pkgdir"/usr/share/dict
    iconv -f latin1 -t utf-8 "$srcdir"/rockyou.txt | sort -u > "$pkgdir"/usr/share/dict/rockyou.txt
    chmod 644 "$pkgdir"/usr/share/dict/rockyou.txt
}
