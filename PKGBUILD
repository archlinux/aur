
# Contributor: Joe Davison <joedavison.davison@gmail.com>

pkgname=irssistats
pkgver=0.75
pkgrel=2
pkgdesc='Parses irssi log files as stats presented in HTML'
url='http://royale.zerezo.com/irssistats/'
license=(GPL)
depends=('irssi')
arch=('i686' 'x86_64')
install=irssistats.install
source=('irssistats.install' "http://royale.zerezo.com/irssistats/irssistats-0.75.tar.gz")
md5sums=('ba71de6c892f886cf0a5b49d7eacbb49'
         'f3654fd292220bd9adada7ff6c7f0421')
build() {
    cd $srcdir/$pkgname-$pkgver

    mkdir -p $pkgdir/{usr/bin,etc/$pkgname,etc/webapps/$pkgname}

    make
    install -m 755 $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/bin
    
    # Copy sample files
    cp $srcdir/$pkgname-$pkgver/sample.* $pkgdir/etc/irssistats

    # Copy "data" html files to webapps
    cp -R $srcdir/$pkgname-$pkgver/data $pkgdir/etc/webapps/$pkgname
}
