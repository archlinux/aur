#Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>

pkgname=('sat-tmp-hg')
_realname=sat_tmp
pkgver=0.7.r52.2068cf3009da
VERSION=0.7
pkgrel=1
url="https://salut-a-toi.org/"
arch=('any')
depends=('python2')
makedepends=('')
provides=('sat-tmp')
conflicts=('sat-tmp')
license=('AGPL3')
source=("hg+https://repos.goffi.org/sat_tmp")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$VERSION.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" 
}


                 
package(){
    pkgdesc="sat_tmp aims to temporary store files needed by Salut-a-toi (sat). These monkey patchs are not merged upstream yet. For now, only wokkel is impacted."
    depends=( "python2-wokkel" )
    cd "$pkgdir"
    install -dm755 "usr/lib/python2.7/site-packages/$_realname"  
    cd "$srcdir/$_realname/$_realname/"
    cp -rv * "$pkgdir/usr/lib/python2.7/site-packages/$_realname"
}

