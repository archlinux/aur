# Maintainer: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Maintainer: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor : speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=python2-sipsimple
pkgver=3.0.0
pkgrel=3
pkgdesc="Python SDK for development of SIP end-points"
license=('custom:MIT' 'LGPL')
arch=('i686' 'x86_64')
url="http://download.ag-projects.com/SipClient"
depends=('alsa-lib' 'util-linux' 'python2-dateutil' 'cython2' 'python2-cjson'
         'python2-dnspython' 'python2-eventlib' 'python2-msrplib' 'python2-xcaplib' 'python2-otr-git' 'python2-application')
makedepends=('subversion')
options=('!makeflags')
source=("http://download.ag-projects.com/SipClient/python-sipsimple-$pkgver.tar.gz")
md5sums=('e14cbb693ecef8fd5f719f8bb5df99be')

build() {
  cd "$srcdir/python-sipsimple-$pkgver"
  python2 setup.py build_ext --pjsip-clean-compile
}

package() {
  cd "$srcdir/python-sipsimple-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

