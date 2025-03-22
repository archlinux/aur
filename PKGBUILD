# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-czipdec-git
pkgver=r2.cc77ae6
pkgrel=1
pkgdesc="A Python package for decrypting data, using the C implementation of ZIP data decryption."
arch=('x86_64')
url="https://github.com/Rin-Wood/czipdec"
license=('BSD')
provides=('python-czipdec')
conflicts=('python-czipdec')
depends=(
  'python'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')

source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd czipdec
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd czipdec
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
