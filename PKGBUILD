# Maintainer: siphr <archlinux@techtum.dev>
pkgname=urdu-digit
pkgver=0.2
pkgrel=2
pkgdesc="Convert English digit to Urdu."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/urdu-digit.git")
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
