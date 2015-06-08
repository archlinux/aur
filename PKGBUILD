# Maintainer: Sven Karsten Greiner <sven@sammyshp.de>

pkgname=geolog
pkgver=2.92
pkgrel=1
pkgdesc="Make your own geocaching website with statistics"
arch=('any')
url="http://geolog.sourceforge.net/geolog.html"
license=('GPL')
depends=(
        'perl'
        'perl-http-cookies'
        'perl-file-which'
        'perl-file-homedir'
        'perl-archive-zip'
        'perl-term-readkey'
        'perl-geo-inverse'
        'perl-dbi'
        'perl-math-round'
        'perl-dbd-sqlite'
        'perl-xml-xpath'
        'perl-www-mechanize-gzip'
        'perl-lwp-protocol-https'
        'perl-json-xs'
        'perl-date-calc'
        'perl-log-log4perl'
        'perl-math-polygon'
        'perl-gd'
    )
optdepends=('ocprop: Synchronize with OpenCaching')
source=("https://sourceforge.net/project/downloading.php?groupname=geolog&filename=$pkgname-$pkgver.tgz")
md5sums=('7d0d0227993c9e01500de26d763f852e')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # documentation
    for file in {FAQ,liesmich,readme}.html; do
        install -Dm644 "$file" "$pkgdir/usr/share/doc/$pkgname/$file"
    done

    # executable
    install -Dm755 geolog.pl "$pkgdir/usr/bin/$pkgname"
}
