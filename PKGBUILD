# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds
pkgname=python-misaka
_pkgname=misaka
pkgver=2.1.1
pkgrel=2
pkgdesc="A CFFI binding for Hoedown, a markdown parsing library."
arch=('i686' 'x86_64')
url="http://misaka.61924.nl/"
license=('MIT')
depends=('python>=2.7' 'python-cffi')
options=(!emptydirs)
conflicts=('python-misaka-v1')
source=("https://files.pythonhosted.org/packages/fa/87/b1020510a00aba1b936477e54180b143df654c565b84936b0b3e85272cf2/misaka-2.1.1.tar.gz")
sha256sums=('62f35254550095d899fc2ab8b33e156fc5e674176f074959cbca43cf7912ecd7')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
