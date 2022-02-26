#Maintainer: jnanar <info@agayon.be>

pkgname='libervia-web-hg'
_realname=libervia
pkgver=0.9.0.r1492.3a34d78f2717
_version=0.9.0
pkgrel=1
url="http://salut-a-toi.org/"
arch=('any')
pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (Web interface)"
provides=('libervia-web')
depends=('python' 'python-jinja' 'python-shortuuid-git' 'libervia-media-hg' 'libervia-backend-hg' 'libervia-templates-hg' 'python-zope-interface' 'python-pyopenssl' 'python-autobahn' 'dbus' 'python-brython')
makedepends=('python-setuptools' 'mercurial')
license=('AGPL3')
install=$pkgname.install
source=("hg+https://repos.goffi.org/libervia")

md5sums=('SKIP')

options=('!strip')

pkgver() {
    cd "$srcdir/$_realname"
    printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}


package(){
    cd "$srcdir/$_realname"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 
    install -dm755 etc
    cp ../../sat.conf etc/
 }
