# Maintainer: siphr <archlinux@techtum.dev>
pkgname=c19
pkgver=0.0
pkgrel=3
pkgdesc="COVID-19 Stats for the country of Pakistan."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/c19.git")
url=https://www.techtum.dev/work-c19-220109.html
license=('MIT')

build() {
    echo "PREPARING..."
    pip install pycountry 
    pip install c19
    
    echo "echo BUILD DATE: `date`" > c19
    echo "python -m c19 \$@" >> c19

    chmod +x $srcdir/c19
}

package() {
    echo "INSTALLING..."
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/c19" "$pkgdir/usr/bin/c19"
    echo 'Finished setting up c19.'
}
md5sums=('SKIP')
