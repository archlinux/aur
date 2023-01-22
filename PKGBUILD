# Thanks to the maintainer(s) of chirp-daily
# Maintainer: K5TRP <K5TRP@protonmail.com>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ashley Roll (ash@digitalnemesis.com)
# Contributor: Erez Raviv (erezraviv@gmail.com)

pkgname=chirp-next
pkgver=20230122
pkgrel=1
pkgdesc="GUI tool for programming ham radios, built from daily build"
arch=('any')
url="https://chirp.danplanet.com"
license=('GPL3')
depends=('python-six' 'python-pyserial' 'python-future' 'python-requests' 'python-suds' 'python-yattag' 'python-wxpython')
optdepends=('hamradio-menus: XDG menus for ham radio software')
options=(!emptydirs)
conflicts=('chirp' 'chirp-daily')
provides=(chirp)
install=$pkgname.install
source=("https://trac.chirp.danplanet.com/chirp_next/next-$pkgver/chirp-next-$pkgver.tar.gz")
# Checksum: https://trac.chirp.danplanet.com/chirp_daily/daily-$pkgver/SHA1SUM
sha1sums=('a28a631cbd860889296479f07e9129c9cc0c5055')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
