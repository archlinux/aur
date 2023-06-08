#Maintainer: jnanar <info@agayon.be>

pkgname='libervia-web-hg'
_realname=libervia
pkgver=0.9.0.r1522.a44f77559279
_version=0.9.0
pkgrel=2
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

build() {
    cd "$srcdir/$_realname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_realname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

