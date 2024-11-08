# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-catelier-git
pkgver=r6.99ce902
pkgrel=1
pkgdesc="A python package for decrypting data, using a custom atelier decryption algorithm implemented in C."
arch=('x86_64')
url="https://github.com/Rin-Wood/catelier"
license=('BSD')
provides=('python-catelier')
conflicts=('python-catelier')
depends=(
  'python'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/Rin-Wood/catelier.git")
md5sums=('SKIP')

pkgver() {
  cd catelier
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd catelier
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
