# Maintainer: Mickaël 'lastmikoi' Falck <lastmikoi+abs@lastmikoi.net>
pkgname=dl-cli
pkgver=0.12
pkgrel=1
pkgdesc="Command line tool for submitting files into 'dl' download ticket service"
arch=('any')
url="http://www.thregr.org/~wavexx/software/dl/"
license=('GPL2')
depends=('python2>=2.7' 'python2-pycurl')
install=dl-cli.install
source=("https://github.com/wavexx/dl/archive/dl-$pkgver.tar.gz"
        "use_python2.patch")
md5sums=('380e05aa8f0049ced1e988857bca0ca3'
         'cc4936b3fd56320e96568bbe5c8fb290')

prepare() {
    patch -u "$srcdir/dl-dl-$pkgver/client/dl-cli.py" use_python2.patch 
}

package() {
    # This superfluous «dl-» is strange...
    cd "$srcdir/dl-dl-$pkgver"

    install -D -T ./client/dl-cli.py "$pkgdir/usr/bin/dl-cli"
}
