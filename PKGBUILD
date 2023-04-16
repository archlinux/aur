# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor : Fernando "Firef0x" G.P. da Silva <firefgx { aT ) gmail [ d0t } com>

pkgname=ydcv
pkgdesc="YouDao Console Version - Simple wrapper for Youdao online translate (Chinese <-> English) service API, as an alternative to the StarDict Console Version (sdcv)"
pkgver=0.7
_commit=bd73c0a0b09587ef64794c593253a5b464e2e52e
pkgrel=7
arch=("any")
url="https://github.com/felixonmars/ydcv"
license=("GPL")
depends=('python')
makedepends=('git' 'python-setuptools-scm' 'python-setuptools-markdown')
source=("git+https://github.com/felixonmars/ydcv.git#commit=$_commit")
sha512sums=('SKIP')

package() {
  cd ydcv
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 contrib/zsh_completion "$pkgdir"/usr/share/zsh/site-functions/_$pkgname
}

# vim:set ts=2 sw=2 et:
