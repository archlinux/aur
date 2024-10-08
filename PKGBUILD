# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-wannacri-git
pkgver=r29.3cea5e9
pkgrel=1
pkgdesc="Criware media formats library."
arch=('x86_64')
url="https://github.com/donmai-me/WannaCRI"
license=('MIT')
provides=('wannacri')
conflicts=('python-wannacri')
depends=(
  'python-future'
  'python-python-ffmpeg'
)
makedepends=('git')

source=("git+https://github.com/donmai-me/WannaCRI.git")
md5sums=('SKIP')

pkgver() {
  cd WannaCRI
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd WannaCRI
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm 644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
