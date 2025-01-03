# Maintainer: Neko_Rikka <yjzyl9008 at gmail dot com>

pkgname=python-wannacri-git
pkgver=r29.3cea5e9
pkgrel=2
pkgdesc="Criware media formats library."
arch=('x86_64')
url="https://github.com/donmai-me/WannaCRI"
license=('MIT')
provides=('wannacri')
conflicts=('python-wannacri')
depends=(
  'python-ffmpeg-python'
  'python-json-logger'
)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'git')
source=("git+https://github.com/donmai-me/WannaCRI.git")
md5sums=('SKIP')

pkgver() {
  cd WannaCRI
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd WannaCRI
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
  install -Dm0644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm0644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
