#Maintainer: jnanar <info@agayon.be>
# Contributor: wido <widowild [at] myopera [dot] com>
# Contributor: Skippy the Kangoo <Skippythekangoo CHEZ yahoo POINT fr>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname='sat-xmpp-hg'
_realname=sat
pkgver=0.7.0.r3453+.864485605d12+
_version=0.7.0
pkgrel=1
url="http://salut-a-toi.org/"
pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (core)"
arch=('any')
depends=('python' 'dbus' 'python-lxml' 'python-pillow' 'python-pyopenssl' 'python-dbus' 'python-twisted' 'python-wokkel-git' 'python-xdg' 'python-zope-interface' 'python-mutagen' 'python-markdown' 'python-shortuuid-git' 'python-html2text' 'python-netifaces' 'python-service-identity' 'sat-tmp-hg' 'python-dateutil' 'python-regex' 'python-gobject' 'python-pyinotify' 'python-babel' 'python-urwid' 'python-urwid-satext-hg' 'python-xlib' 'python-treq' 'python-miniupnpc' 'python-langid' 'python-miniupnpc' 'python-omemo-backend-signal' 'python-omemo-syndace' 'python-potr')
optdepends=('python-progressbar')
makedepends=('python-setuptools' 'mercurial')
license=('AGPL3')
source=("hg+https://repos.goffi.org/sat")
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
