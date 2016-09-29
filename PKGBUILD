# Maintainer: Daniel Milde <daniel@milde.cz> 
pkgname=python-err
pkgver=4.3.3
pkgrel=1
pkgdesc="A plugin based chatbot designed to be easily deployable, extensible and maintainable."
arch=('any')
url="http://errbot.net"
license=('GPL')
depends=('python'
         'python-markdown'
         'python-ansi'
         'python-colorlog'
         'python-daemonize'
         'python-bottle'
         'python-pip'
         'python-jinja'
         'python-yapsy'
         'python-webtest')
makedepends=('python-setuptools')
optdepends=('python-sleekxmpp: XMPP backend'
            'python-pyasn1: XMPP backend'
            'python-pyasn1-modules: XMPP backend'
            'python-dnspython: XMPP backend'
            'python-tox: TOX backend'
            'python-irc: IRC backend')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/f3/d1/87eaa3de23234de49a35ceed8461694429c7d2499c68d84de1de3f5e163a/errbot-4.3.3.tar.gz#md5=82914b7f18d7fa2360d8397696601438")
sha256sums=('64e540a6897ab65b9acff32700bbda5c0ba40aaa5e66769f2951882e5165ddfc')

package() {
  cd "$srcdir/errbot-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  chmod 644 ${pkgdir}/usr/lib/python3.5/site-packages/errbot-${pkgver}-py3.5.egg-info/*
}

# vim:set ts=2 sw=2 et:
