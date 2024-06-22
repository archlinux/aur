pkgname='python-consonance-git'
pkgver=0.1.5.r1.g40abb98
pkgrel=1
pkgdesc="implements WhatsApp's handshake process which makes use of Noise Pipes from Noise Protocol"
url="https://github.com/tgalal/consonance"
arch=('any')
license=('GPL')
depends=('python' 'python-transitions' 'python-protobuf' 'python-axolotl-curve25519' 'python-dissononce')
makedepends=('python-setuptools' 'git')
provides=('python-consonance')
source=("${pkgname}::git+https://github.com/tgalal/consonance")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/"
}
