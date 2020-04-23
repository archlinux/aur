# Maintainer: Yuval Dahan <yuvaldahn at gmail dot com>
# Maintainer: Amit Botzer <botzer.2002 at gmail dot com>

pkgname=locker
pkgver=0.5.5
pkgrel=0
pkgdesc='linux container'
arch=('x86_64')
url='https://gitlab.com/amit-yuval/locker'
license=('GPL')
makedepends=('go-pie')
optdepends=('apparmor: For use of apparmor features'
            'iproute2: For network setup')
source=("https://gitlab.com/amit-yuval/locker/-/archive/V$pkgver/locker-V$pkgver.tar.gz")
sha512sums=('5b1dcf7a378665d00a64bcb00be73878585eecd756860947a4b1f2c7e8910c3cbd45040ea95e1f01a8986f1bc34c69b8184ab28bfa61b92649219a30dc153386')
backup=('etc/locker/seccomp_default.json'
        'var/lib/locker/images.json')

build() {
  cd $pkgname-V$pkgver
  make
}

package() {
  cd $pkgname-V$pkgver
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et nowrap:
