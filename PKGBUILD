# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=ocprop
pkgver=2.21
pkgrel=1
pkgdesc="Upload logs and caches to opencaching.de"
arch=('any')
url="http://geolog.sourceforge.net/ocprop.html"
license=('GPL')
depends=(
        'geolog'
        'perl'
        'perl-http-cookies'
        'perl-file-which'
        'perl-file-homedir'
        'perl-archive-zip'
        'perl-term-readkey'
        'perl-lwp-protocol-https'
        'perl-gd'
        'perl-io-string'
    )
source=("https://sourceforge.net/project/downloading.php?groupname=geolog&filename=$pkgname-$pkgver.tgz")
md5sums=('1d815f4787963a4be2bc107e576e5823')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # documentation
    for file in {FAQ,liesmich}.html; do
        install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done

    # executable
    install -Dm755 ocprop.pl "$pkgdir/usr/bin/$pkgname"
}
