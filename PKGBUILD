# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagegen'
_pkgname="${pkgname#python-}"
pkgver=3.3.3
pkgrel=1
pkgdesc='Python static site generator with reStructuredText markup'
arch=('any')
license=('GPL')
url='http://pagegen.phnd.net/'
wheel="${_pkgname}-$pkgver-py3-none-any.whl"
source=(
  "https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$wheel"
)
depends=(
  'python-docutils'
  'python-htmlmin'
  'python-jsmin'
  'python-lxml'
  'python-rcssmin'
)
makedepends=(
  'python-pip'
)
sha256sums=(
  '8bbc526582409bb8f63b8b1b8ff917a22ad64e70586552b348495269bc891be3'
)
sha512sums=(
  'e318669efc533b83b67402a1f9064bad9f6111a536f9c073776855f208476baf791962a4ead6712cd7bad5c0095e5859ddf11b4e86cb82d4788179997773030e'
)
b2sums=(
  '3fd58cb396478a40b561a99b6d573c929bda17d58d205a3c5e9ba33ea12b8d2b81358c47ec5ba0e3e5ded8fd1bfbfa34e09a07c42edffb1b5c43eff605c08c54'
)

package() {
  umask 0022
  pip install \
    --force-reinstall \
    --ignore-installed \
    --no-warn-script-location \
    --no-deps \
    --compile \
    --root="$pkgdir" \
    --prefix='/usr' \
      "$srcdir/$wheel"
}

# eof
