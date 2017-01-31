# Maintainer: Alex Kubica <alexkubicail@gmail.com>
# Contributor: Manoel Vilela <manoel_vilela@engineer.com>
_name=mal
_tag=v0.3.0
pkgname=python-mal-git
pkgver=r177.e223001
pkgrel=1
pkgdesc="MyAnimeList command line interface"
arch=(any)
url="http://manoel.tk/MAL/"
license=('GPL3')
depends=('python' 'python-requests' 'python-appdirs' 'python-decorating' 'python-argparse')
makedepends=('git')
source=("git+https://github.com/ryukinix/${_name}.git#tag=${_tag}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_name}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
