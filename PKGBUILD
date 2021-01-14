#Maintainer: jnanar <info@agayon.be>

pkgname='sat-libervia-hg'
_realname=libervia
pkgver=0.7.0.r1377.46ce79eac754
_version=0.7.0
pkgrel=1
url="http://salut-a-toi.org/"
arch=('any')
pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (Web interface)"
provides=('sat-libervia')
depends=('python' 'python-jinja' 'python-shortuuid-git' 'sat-media-hg' 'sat-xmpp-hg' 'sat-templates-hg' 'python-zope-interface' 'python-pyopenssl' 'python-autobahn' 'dbus' 'python-brython')
makedepends=('python-setuptools' 'mercurial')
license=('AGPL3')
install=$pkgname.install
source=("hg+https://repos.goffi.org/libervia")

md5sums=('SKIP')

options=('!strip')

pkgver() {
    cd "$_realname"
    printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}


package(){
    cd "$_realname"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 
    install -dm755 etc
    cp ../../sat.conf etc/
 }
