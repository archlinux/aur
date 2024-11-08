# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-cbbs-git
pkgver=r3.6f5ff5e
pkgrel=1
pkgdesc="A python package for decrypting data, using a custom bbs decryption algorithm implemented in C."
arch=('x86_64')
url="https://github.com/Rin-Wood/cbbs"
license=('BSD')
provides=('python-cbbs')
conflicts=('python-cbbs')
depends=(
  'python'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/Rin-Wood/cbbs.git")
md5sums=('SKIP')

pkgver() {
  cd cbbs
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd cbbs
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
