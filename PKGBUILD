# Maintainer: Cedric Girard <cgirard.archlinux@valinor.fr>
#Contributor: Olivier Le Moal <mail at olivierlemoal dot fr>
#Contributor: Dawid Wrobel <cromo@klej.net>
#Contributor: Sébastien Duquette <ekse.0x@gmail.com>
#Contributor: onny <onny@project-insanity.org>

pkgname=wfuzz
pkgver=2.3.4
pkgrel=3
pkgdesc="Utility to bruteforce web applications to find their not linked resources"
url="https://github.com/xmendez/wfuzz"
arch=('any')
license=('GPL')
depends=('python-pycurl' 'python-pyparsing' 'python-future')
makedepends=('python-setuptools')
source=("https://github.com/xmendez/wfuzz/archive/v$pkgver.tar.gz"
        "https://github.com/xmendez/wfuzz/pull/117.diff")
sha256sums=('87ff36d866cb173389f90cf026136758d3af73079a6199961de12ed86568be51'
            'd320a192f65b8bce8acd2fa285331ab69ea996cbfe76f3d2563de7ccfe11dd0e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../117.diff

}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
