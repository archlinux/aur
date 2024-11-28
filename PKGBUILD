# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-xxtea-git
pkgver=r187.461d11f
pkgrel=1
pkgdesc="Python extension module xxtea."
arch=('x86_64')
url="https://github.com/ifduyue/xxtea"
license=('BSD')
provides=('python-xxtea')
conflicts=('python-xxtea')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
depends=('python')
source=("git+https://github.com/ifduyue/xxtea.git")
md5sums=('SKIP')

pkgver() {
  cd xxtea
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd xxtea
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.rst "${pkgdir}/usr/share/doc/${pkgname}/README"
}
