# Maintainer: Daniel Milde <daniel@milde.cz> 
pkgname=python-err
pkgver=4.3.0
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
source=("https://pypi.python.org/packages/e8/0e/562650610c1a4785cdf0a73fc01fdcd163a7a9f7800e24247437d31d7623/errbot-4.3.0.tar.gz#md5=f9e5dacee8bf05c9e483d2c9d44173c7")
sha256sums=('6e42e76a7f8bb89dada8cd42e84619c941509c9a91528ff50c99f42de43c02c9')

package() {
  cd "$srcdir/errbot-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  chmod 644 ${pkgdir}/usr/lib/python3.5/site-packages/errbot-${pkgver}-py3.5.egg-info/*
}

# vim:set ts=2 sw=2 et:
