# Maintainer: siphr <archlinux@techtum.dev>
pkgname=pyfrx
pkgver=0.0
pkgrel=2
pkgdesc="Forex Rates and Conversions."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/pyfrx.git")
url=https://www.techtum.dev/work-pyfrx-220105.html
license=('MIT')

build() {
    echo "PREPARING..."
    pip install pyfrx
    
    echo "echo BUILD DATE: `date`" > pyfrx
    echo "python -m pyfrx \$@" >> pyfrx

    chmod +x $srcdir/pyfrx
}

package() {
    echo "INSTALLING..."
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/pyfrx" "$pkgdir/usr/bin/pyfrx"
    echo 'Finished setting up pyfrx.'
}
md5sums=('SKIP')
