# Maintainer: Camden Cheek <ccheek22@gmail.com>
pkgname="vimdoc"
pkgver=0.6.0
pkgrel=1
pkgdesc="Helpfile generation for vim plugins"
arch=('any')
url="https://github.com/google/vimdoc"
license=('apachev2')
depends=()
makedepends=('python>=3.6')
replaces=()
source=('https://github.com/google/vimdoc/archive/v0.6.0.tar.gz')
sha256sums=('18cdec7202d8d6a8e8250a2ad0152473a2408d58c9222a659606a3a439a57c70') 

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py config
  python3 setup.py build
  python3 setup.py install --root="${pkgdir}/" || return 1
}
