# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-crijndael-git
pkgver=r6.aae6121
pkgrel=1
pkgdesc="A python package for decrypting data, using a custom AES-256 decryption algorithm."
arch=('x86_64')
url="https://github.com/Rin-Wood/crijndael"
license=('BSD')
provides=('python-crijndael')
conflicts=('python-crijndael')
depends=(
  'python'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+https://github.com/Rin-Wood/crijndael.git")
md5sums=('SKIP')

pkgver() {
  cd crijndael
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd crijndael
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
