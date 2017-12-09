# $Id$
# Maintainer: Eduard Kracmar <info[at]adaptiware[dot]com>

pkgname=mmonit
pkgver=3.7.1
pkgrel=6
pkgdesc="Easy, proactive monitoring of Unix systems, network and cloud services. Conduct automatic maintenance and recovery and execute meaningful causal actions in error situations."
arch=('x86_64')
url="http://mmonit.com/"
license=('Commercial')
#depends=('openssl')
source=(https://mmonit.com/dist/$pkgname-$pkgver-linux-x64.tar.gz \
        mmonit.service)
backup=('opt/mmonit/conf/server.xml' 'opt/mmonit/conf/web.xml' 'opt/mmonit/db/mmonit.db')

package() {
  mkdir -p $pkgdir/opt/$pkgname || return 1
  cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/opt/$pkgname || return 1
  install -D -m644 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/$pkgname.service
}

sha256sums=('2b152757f7d7be69bc88e57e37a03216663443d35beba2dc586df55cb199bd4b'
            '9a4edf62ef3da3af1e3dcfebd7b3bb3f96e81c5a9767021f0e4ed775f2dbb469')
