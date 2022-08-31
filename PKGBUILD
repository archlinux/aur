# Maintainer: Robert Greener <me@r0bert.dev>

pkgname=hg-signoff
pkgver=1.1.1
pkgrel=1
pkgdesc='Flexible evolution of Mercurial history'
arch=('any')
license=('GPL2')
depends=('mercurial')
makedepends=('python-build' 'python-installer' 'python-wheel')
url='https://www.mercurial-scm.org/doc/evolution/'
source=("https://hg.sr.ht/~ragreener1/hg-signoff/archive/v1.1.1.tar.gz")
sha256sums=('a79adaa95d6c3f0a058876548b8a17e01b75082a7e063df8daba8908aae06cd9')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}
package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:

