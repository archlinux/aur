# Maintainer: Juan Jaramillo <jmboris at gmail dot com>



# Author: Weihong Guan (@aGuegu)
# E-mail: weihong.guan[at]gmail.com
# Host: https://github.com/aguegu/greenrain


pkgname=greenrain
pkgver=1
pkgrel=1
pkgdesc="Generate Green Rain / Matrix Digital Rain in Linux Terminal with curses lib"
arch=('any')
url="https://github.com/aguegu/greenrain"
license=('GNU')
depends=('git' )
source=()
md5sums=()
_gitroot="https://github.com/aguegu/$pkgname.git"
_gitname="$pkgname"

build()
{
    cd ${srcdir}/

    msg "Connecting to the GIT server...."
    if [[ -d ${srcdir}/${_gitname} ]] ; then
        cd ${_gitname}
        git pull origin
        msg "The local files are updated..."
    else
        git clone ${_gitroot}
    fi
    
    msg "GIT checkout done."


}





package() {
  cd "$pkgname"
  make
  install -Dm755 greenrain $pkgdir/usr/bin/greenrain
  #install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  #install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}


