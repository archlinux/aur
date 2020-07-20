pkgname=teatool
pkgver=1.7
pkgrel=1
pkgdesc="Tiny algorithm encryption utility"
url="https://github.com/turbocat2001/TEAtool"
source=('git+https://github.com/turbocat2001/TEAtool.git')
license=('GPLv3')
arch=(x86_64)
md5sums=('SKIP')


build(){
   cd TEAtool
   lang="$(locale | grep LANG)" 
   if [ $lang = "LANG=ru_RU.UTF-8" ]
    then 
        make rus
    else
        make 
    fi
}

package() {
    cd TEAtool
    mkdir -p $pkgdir/usr/bin
    make install DIR=$pkgdir/usr/bin
}


