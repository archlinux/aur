#Maintainer: ParadoxSpiral <skullduggery@riseup.net>
#Contributor: David Campbell <davekong@archlinux.us>
#Contributor: Cilyan Olowen <gaknar@gmail.com>
#Contributor: AXilleas Pipinellis <axilleas archlinux.gr>
pkgname=python2-pylons
pkgver=1.0.1
pkgrel=2
pkgdesc='A lightweight web framework emphasizing flexibility and rapid development.'
arch=('any')
url='http://pylonsproject.com/'
license=('BSD')
depends=('python2'                    'python2-routes>=1.12'      'python2-webhelpers>=0.6.4'
         'python2-beaker>=1.3'         'python2-paste>=1.7.2'      'python2-paste-deploy>=1.3.3'
         'python2-paste-script>=1.7.3' 'python2-formencode>=1.2.1'
         'python2-simplejson>=2.0.8'   'python2-decorator>=2.3.2'  'python2-nose>=0.10.4'
         'python2-mako>=0.2.4'         'python2-webob>=0.9.6.1'   'python2-weberror>=0.10.1'
         'python2-webtest>=1.1'        'python2-tempita>=0.2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/P/Pylons/Pylons-${pkgver}.tar.gz)
replaces=('python-pylons')
md5sums=('6cb880d75fa81213192142b07a6e4915')

package() {
  cd $srcdir/Pylons-${pkgver}
  python2 setup.py install --root=$pkgdir/ --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find $pkgdir -name '*.py')
}
