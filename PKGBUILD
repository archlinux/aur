pkgname=teatool-git
pkgver=1.8
pkgrel=1
pkgdesc="Tiny algorithm encryption utility"
url="https://github.com/turbocat2001/TEAtool"
source=('https://github.com/turbocat2001/TEAtool/archive/'v${pkgver}'-linux64.tar.gz')
license=('GPLv3')
arch=(x86_64)
md5sums=('SKIP')


build(){
   cd TEAtool-${pkgver}-linux64
   lang="$(locale | grep LANG)" 
   if [ $lang = "LANG=ru_RU.UTF-8" ]
    then 
        make rus
    else
        make 
    fi
}

package() {
    cd TEAtool-${pkgver}-linux64
    mkdir -p $pkgdir/usr/bin
    make install DIR=$pkgdir/usr/bin
}


