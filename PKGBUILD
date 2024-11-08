# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-ctea-git
pkgver=r3.55f168a
pkgrel=1
pkgdesc="A python package for decrypting data, using a custom TEA decryption algorithm implemented in C."
arch=('x86_64')
url="https://github.com/Rin-Wood/ctea"
license=('BSD')
provides=('python-ctea')
conflicts=('python-ctea')
depends=(
  'python'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/Rin-Wood/ctea.git")
md5sums=('SKIP')

pkgver() {
  cd ctea
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ctea
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
