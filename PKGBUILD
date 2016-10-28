# $Id$
# Maintainer: Eduard Kracmar <info[at]adaptiware[dot]com>

pkgname=mmonit
pkgver=3.6.2
pkgrel=1
pkgdesc="Easy, proactive monitoring of Unix systems, network and cloud services. Conduct automatic maintenance and recovery and execute meaningful causal actions in error situations."
arch=('x86_64')
url="http://mmonit.com/"
license=('Commercial')
#depends=('openssl')
source=(https://mmonit.com/dist/$pkgname-$pkgver-linux-x64.tar.gz \
        mmonit.service)

package() {
  mkdir -p $pkgdir/opt/$pkgname || return 1
  cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/opt/$pkgname || return 1
  install -D -m644 ${srcdir}/$pkgname.service ${pkgdir}/usr/lib/systemd/system/$pkgname.service
}

sha256sums=('8bb04d102af936dd0ebae6fe24d1638ad67c0c4c5819685d6686d714cd1f18c8'
            '9a4edf62ef3da3af1e3dcfebd7b3bb3f96e81c5a9767021f0e4ed775f2dbb469')
