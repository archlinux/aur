# Maintainer: siphr <archlinux@techtum.dev>
pkgname=rwu
pkgver=0.0
pkgrel=6
pkgdesc="Random Urdu words/phrases generator."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/urw.git")
url=https://www.techtum.dev/work-urw-220310.html
license=('MIT')

build() {
    echo "PREPARING..."
    pip install -U urw
    
    echo "echo BUILD DATE: `date`" > rwu
    echo "python -m urw.urw \$@" >> rwu

    chmod +x $srcdir/rwu
}

package() {
    echo "INSTALLING..."
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/rwu" "$pkgdir/usr/bin/rwu"
    echo 'Finished setting up rwu.'
}

md5sums=('SKIP')
