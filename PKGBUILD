# $Id$
# Maintainer: Eduard Kracmar <info[at]adaptiware[dot]com>

pkgname=mmonit
pkgver=3.5
pkgrel=2
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

sha256sums=('c872bd09811804ff4f41319507b77626926f3a028b56e2f320d470f07e032c7b'
            '9a4edf62ef3da3af1e3dcfebd7b3bb3f96e81c5a9767021f0e4ed775f2dbb469')


