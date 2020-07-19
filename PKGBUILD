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
   while true
        do
        echo "Select language: 1) English 2) Russian"
        read lang 
        if [ $lang == "1" ]
        then 
            echo "English selected!"
            make 
            break
        elif [ $lang == "2" ]
        then 
            echo "Russian selected!"
            make rus 
            break
        fi
    done
}

package() {
    cd TEAtool
    mkdir -p $pkgdir/usr/bin
    make install DIR=$pkgdir/usr/bin
}


