#Maintainer: jnanar <info@agayon.be>
# Contributor: wido <widowild [at] myopera [dot] com>
# Contributor: Skippy the Kangoo <Skippythekangoo CHEZ yahoo POINT fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname='libervia-backend-hg'
_realname='libervia-backend'
pkgver=0.8.0.r3734.643622ff1492
_version=0.8.0
pkgrel=1
url="http://salut-a-toi.org/"
pkgdesc="Libervia, multi-frontends multi-purposes XMPP client (core)"
arch=('any')
conflicts=('sat-xmpp-hg')
provides=('libervia-backend')
depends=('python' 'dbus' 'python-lxml' 'python-pillow' 'python-pyopenssl' 'python-dbus' 'python-twisted' 'python-wokkel-git' 'python-xdg' 'python-zope-interface' 'python-mutagen' 'python-markdown' 'python-shortuuid-git' 'python-html2text' 'python-netifaces' 'python-service-identity' 'sat-tmp-hg' 'python-dateutil' 'python-regex' 'python-gobject' 'python-pyinotify' 'python-babel' 'python-urwid' 'python-urwid-satext-hg' 'python-xlib' 'python-treq' 'python-miniupnpc' 'python-langid' 'python-miniupnpc' 'python-omemo-backend-signal' 'python-omemo-syndace-git' 'python-pyaml' 'python-progressbar' 'python-pycrypto' 'python-xeddsa-git' 'python-x3dh-git' 'python-omemo-backend-signal-git' 'python-potr' 'python-sqlalchemy' 'python-alembic' 'python-txdbus')
makedepends=('python-setuptools' 'mercurial' 'python-pip')
license=('AGPL3')
source=("hg+https://repos.goffi.org/libervia-backend")
md5sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$_realname"
    printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

prepare() {
  cd "$srcdir/$_realname"
  sed -i -e "s/'dbus-python',//" setup.py
}

build() {
    cd "$srcdir/$_realname"
    python setup.py build
}

package(){
    cd "$srcdir/$_realname"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
 }
