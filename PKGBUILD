# Contributor: Florijan Hamzic <florijanh@gmail.com>

_pkgname="python-rcssmin"
pkgname="${_pkgname}"
pkgver=1.0.5
pkgrel=1
pkgdesc="rCSSmin is a CSS minifier written in python."
arch=('i686' 'x86_64')
url="https://github.com/ndparker/rcssmin"
license=('APACHE')
depends=('python>=3.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(https://github.com/ndparker/rcssmin/archive/${pkgver}.tar.gz package.cfg.patch)
md5sums=('fac36129c42a132c8cf08f879e97e96f' 'd07c131e7184213e74c17d2126ace44a')

build(){
  cd "${srcdir}"
  patch -R -p1 -i ../package.cfg.patch
}

package() {
  cd "${srcdir}/rcssmin-${pkgver}"

  python setup.py install --root="$pkgdir" --prefix=/usr
}
