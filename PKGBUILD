# Maintainer: Daniel Milde <daniel@milde.cz> 
pkgname=python-err
pkgver=4.0.1
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
            'python-tox-git: TOX backend'
            'python-irc: IRC backend')
options=(!emptydirs)
install=
source=("https://pypi.python.org/packages/source/e/errbot/errbot-$pkgver.tar.gz")
sha256sums=('c519573a72f3db9376d9ccff9e25adca7aa0ba5dd9b7e2a2a61636aea8b224ac')

package() {
  cd "$srcdir/errbot-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  chmod 644 ${pkgdir}/usr/lib/python3.5/site-packages/errbot-${pkgver}-py3.5.egg-info/*
}

# vim:set ts=2 sw=2 et:
