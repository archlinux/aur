# Maintainer: siphr <archlinux@techtum.dev>
pkgname=spcs
pkgver=0.0
pkgrel=1
pkgdesc="Pakistan Sindh Police Complaints Status."
depends=(python)
arch=(x86_64)
source=("https://github.com/siphr/spcs.git")
url=https://www.techtum.dev/work-spcs-220121.html
license=('MIT')

build() {
    echo "PREPARING..."
    pip install spcs 
    
    echo "echo BUILD DATE: `date`" > spcs
    echo "python -m spcs \$@" >> spcs

    chmod +x $srcdir/spcs
}

package() {
    echo "INSTALLING..."
    mkdir -p $pkgdir/usr/bin
    cp "$srcdir/spcs" "$pkgdir/usr/bin/spcs"
    echo 'Finished setting up spcs.'
}
md5sums=('SKIP')
