#Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>

pkgname=('sat-templates-hg')
_realname=sat_templates
pkgver=0.7.r138.85877c76d47d
VERSION=0.7
pkgrel=1
url="https://salut-a-toi.org/"
arch=('any')
depends=('python2')
makedepends=('')
conflicts=('sat-templates')
provides=('sat-templates')
license=('AGPL3')
source=("hg+https://repos.goffi.org/sat_templates")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$VERSION.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" 
}


                 
package(){
    pkgdesc="sat-templates is a collection of templates for Salut à Toi, the multi-frontends multi-purposes XMPP client (core). For now, it needs to be accessible in the PYTHONPATH"
    depends=('python2-jinja')

    cd "$pkgdir"
    install -dm755 "usr/lib/python2.7/site-packages/$_realname"  
    cd "$srcdir/$_realname"
    cp -rv * "$pkgdir/usr/lib/python2.7/site-packages/$_realname"
}

