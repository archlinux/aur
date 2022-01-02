# Maintainer: siphr <archlinux@techtum.dev>
pkgname=urdu-digit
pkgver=0.2
pkgrel=3
pkgdesc="Convert English digits to Urdu ones."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/urdu-digit.git")
url=https://www.techtum.dev/work-urdu-digit-211001.html
license=('MIT')

build() {
    echo "PREPARING..."
    pip install urdu-digit
    pip install bs4
    
    echo "echo `date`" > urdu-digit 
    echo "python -m urdu_digit \$@" >> urdu-digit

    chmod +x $srcdir/urdu-digit
}

package() {
    echo "INSTALLING..."
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/urdu-digit" "$pkgdir/usr/bin/urdu-digit"
    echo 'Finsihed setting up urdu-digit.'
}
md5sums=('SKIP')
