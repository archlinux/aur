# Maintainer: siphr <archlinux@techtum.dev>
pkgname=pksg
pkgver=0.0
pkgrel=2
pkgdesc="Pakistan SUI Gass Bill and Tariff."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/psg.git")
url=https://www.techtum.dev/work-psg-220228.html
license=('MIT')

build() {
    echo "PREPARING..."
    pip install psg
    
    echo "echo BUILD DATE: `date`" > pksg
    echo "python -m psg \$@" >> pksg

    chmod +x $srcdir/pksg
}

package() {
    echo "INSTALLING..."
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/psg" "$pkgdir/usr/bin/pksg"
    echo 'Finished setting up pksg.'
}

md5sums=('SKIP')
