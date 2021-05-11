#Maintainer: William Aass Dahlen <cznk@protonmail.com> 

pkgname=azure-kubelogin
pkgver=0.0.9
pkgrel=1
pkgdesc='A Kubernetes credential (exec) plugin implementing azure authentication'
arch=('x86_64')
license=('MIT')
url="https://github.com/Azure/kubelogin"
makedepends=(
    "go"
    "git"
)
source=(
    "git+https://github.com/Azure/kubelogin.git#tag=v$pkgver"
    )

md5sums=('SKIP')

build(){
    cd kubelogin
    make
}

package(){

    cd kubelogin/bin/linux_amd64/
    install -Dm755 kubelogin $pkgdir/usr/bin/kubelogin
    
}
